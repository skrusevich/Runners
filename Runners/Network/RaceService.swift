//
//  RunnersService.swift
//  Runners
//
//  Created by Slava Krusevich on 3/13/19.
//  Copyright © 2019 Slava Krusevich. All rights reserved.
//

import Foundation

struct RaceService {
    
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .custom { LowercasedKey(stringValue: String($0.last!.stringValue.lowercased()))! }
        return decoder
    }()
    
    static func race() async throws -> Race {
        let url = URL(string: "http://849fairmount.com/mobile/runners.json")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try decoder.decode(Race.self, from: data)
    }
}

// MARK: - Key Decoding Strategy

fileprivate struct LowercasedKey: CodingKey {
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
