//
//  JSONDownloader.swift
//  walmart-api-client
//
//  Created by Louis Basile on 3/15/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import Foundation

class JSONDownloader {
    let session: URLSession
    required init(session: URLSession? = nil) {
        self.session = session ?? URLSession(configuration: .default)
    }
    func getJSON(url: URL, completionHandler: @escaping (Any?) -> Void) {
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completionHandler(nil)
                return
            }
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
            completionHandler(jsonObject)
        }.resume()
    }
}
