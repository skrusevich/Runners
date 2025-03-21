//
//  ContentView.swift
//  Runners
//
//  Created by Slava Krusevich on 3/13/19.
//  Copyright © 2019 Slava Krusevich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var runners = [Runner]()
    
    var body: some View {
        Table(runners.sorted()) {
            TableColumn("Name", value: \.name)
            TableColumn("Time", value: \.time.string)
            TableColumn("Age", value: \.age.string)
            TableColumn("Ranking") { runner in
                if let rank = runner.rank {
                    Text(rank.string)
                }
            }
        }
        .task { Task { runners = try await RaceService.race().rankedRannersByAgeGroup } }
    }
}

// MARK: - Helpers

extension Int {
    
    var string: String {
        String(self)
    }
}
