//
//  WalmartItem.swift
//  walmart-api-client
//
//  Created by Louis Basile on 3/15/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import Foundation

struct WalmartItem {
    var name: String
    var shortDescription: String
    var imageURL: String
}

extension WalmartItem {
    init(json: [String: Any]) {
        self.name = json["name"] as? String ?? ""
        self.shortDescription = json["shortDescription"] as? String ?? ""
        self.imageURL = json["largeImage"] as? String ?? ""
    }
}
