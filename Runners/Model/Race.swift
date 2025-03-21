//
//  Race.swift
//  Runners
//
//  Created by Slava Krusevich on 3/13/19.
//  Copyright © 2019 Slava Krusevich. All rights reserved.
//

import Foundation

struct Race: Decodable {
    
    let name: String
    let runners: [Runner]
    
    var rankedRannersByAgeGroup: [Runner] {
        [0...15, 16...29, 30...Int.max].flatMap { runners.ranked($0) }.sorted()
    }
}

// MARK: - Helpers

fileprivate extension Array where Element == Runner {
    
    func ranked(_ range: ClosedRange<Int>) -> Self {
        sorted().filter { range.contains($0.age) }.enumerated().map { $0.element.ranked($0.offset + 1) }
    }
}
