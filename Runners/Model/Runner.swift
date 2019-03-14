//
//  Runner.swift
//  Runners
//
//  Created by Slava Krusevich on 3/13/19.
//  Copyright © 2019 Slava Krusevich. All rights reserved.
//

import Foundation

class Runner: Decodable, CustomStringConvertible, Comparable {
    let name: String
    let time: Int
    let age: Int
    
    var ranking: Int = 0
    
    enum CodingKeys: CodingKey {
        case name
        case time
        case age
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        time = try container.decode(Int.self, forKey: .time)
        age = try container.decode(Int.self, forKey: .age)
    }
    
    static func < (lhs: Runner, rhs: Runner) -> Bool {
        return lhs.time < rhs.time
    }
    
    static func == (lhs: Runner, rhs: Runner) -> Bool {
        return lhs.time == rhs.time
    }
    
    var description: String {
        return "\nRunner: \(name) - \(age) - \(time) - \(ranking)"
    }
}
