//
//  WalmartAPIManager.swift
//  walmart-api-client
//
//  Created by Louis Basile on 3/15/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import Foundation

class WalmartAPIManager {
    let downloader: JSONDownloader
    let baseURL: URL
    required init(downloader: JSONDownloader = JSONDownloader(), baseURL: URL? = nil) {
        self.downloader = downloader
        self.baseURL = baseURL ?? URL(string: "https://api.walmartlabs.com/v1/search")!
    }
    
    func search(_ query: String, numItems: Int, start: Int, completionHandler: @escaping ([WalmartItem]?) -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = searchQueryParams(query, numItems: numItems, start: start)
        downloader.getJSON(url: urlComponents.url!) { (jsonObject) in
            guard let jsonObject = jsonObject as? [String:Any],
            let itemsJSON = jsonObject["items"] as? [[String:Any]] else {
                completionHandler(nil)
                return
            }
            
            var items:[WalmartItem] = []
            for itemJSON in itemsJSON {
                items.append(WalmartItem(json: itemJSON))
            }
            completionHandler(items)
        }
    }
    
    private func searchQueryParams(_ query: String, numItems: Int, start: Int) -> [URLQueryItem] {
        let queryItem = URLQueryItem(name: "query", value: query)
        let format = URLQueryItem(name: "format", value: "json")
        let apiKey = URLQueryItem(name: "apiKey", value: "fpxshbqhmf7dt3rzt4a4nqet")
        let numItems = URLQueryItem(name: "numItems", value: String(numItems))
        let start = URLQueryItem(name: "start", value: String(start))
        return [queryItem, format, apiKey, numItems, start]
    }
}
