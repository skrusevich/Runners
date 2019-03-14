//
//  RunnersService.swift
//  Runners
//
//  Created by Slava Krusevich on 3/13/19.
//  Copyright © 2019 Slava Krusevich. All rights reserved.
//

import Foundation

struct LowercasedKey: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }
}

class RaceService {
    class func race(completionHandler: @escaping (Race?) -> Void) {
        let url = URL(string: "http://849fairmount.com/mobile/runners.json")
        
        APIClient.doTask(url: url!) { (data, error) in
            
            guard error == nil && data != nil else { completionHandler(nil); return }
            
            let decoder = JSONDecoder()
            
            decoder.keyDecodingStrategy = .custom({ (keys) -> CodingKey in
                let key = keys.last!.stringValue.lowercased()
                return LowercasedKey(stringValue: String(key))!
            })
            
            let race: Race? = try? decoder.decode(Race.self, from: data!)
            
            completionHandler(race)
        }
    }
}
