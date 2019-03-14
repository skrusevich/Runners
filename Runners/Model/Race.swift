//
//  Race.swift
//  Runners
//
//  Created by Slava Krusevich on 3/13/19.
//  Copyright © 2019 Slava Krusevich. All rights reserved.
//

import Foundation

class Race: Decodable, CustomStringConvertible {
    let name: String
    let runners: [Runner]
    
    enum CodingKeys: CodingKey {
        case name
        case runners
    }
    
    func updateRunnersRanking() {
        for range in [0...15, 16...29, 30...150] {
            let ageRunners = runners.filter { (runner) -> Bool in
                range.contains(runner.age)
                }.sorted()
            
            for runner in ageRunners {
                runner.ranking = ageRunners.firstIndex(of: runner)! + 1
            }
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        runners = try container.decode([Runner].self, forKey: .runners).sorted()
        
        updateRunnersRanking()
    }
    
    var description: String {
        return "Race name: \(name); Runners: \(runners)"
    }
}
