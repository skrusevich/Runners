//
//  Runner.swift
//  Runners
//
//  Created by Slava Krusevich on 3/13/19.
//  Copyright © 2019 Slava Krusevich. All rights reserved.
//

import Foundation

struct Runner: Decodable, Identifiable {
    
    var id: String { "\(name)\(time)\(age)" }
    
    let name: String
    let time: Int
    let age: Int
    
    private(set) var rank: Int?
    
    func ranked(_ rank: Int) -> Runner {
        Runner(name: name, time: time, age: age, rank: rank)
    }
}

extension Runner: Comparable {
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.time < rhs.time
    }
}
