//
//  APIClient.swift
//  Runners
//
//  Created by Slava Krusevich on 3/13/19.
//  Copyright © 2019 Slava Krusevich. All rights reserved.
//

import Foundation

class APIClient {
    class func doTask(url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completionHandler(data, error)
        }.resume()
    }
}
