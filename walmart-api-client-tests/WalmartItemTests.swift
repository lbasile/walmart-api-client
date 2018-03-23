//
//  WalmartItemTests.swift
//  walmart-api-client-tests
//
//  Created by Louis Basile on 3/15/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import XCTest
@testable import walmart_api_client

class WalmartItemTests: XCTestCase {
    func testFullItemFromJSON() {
        let name = "Sleep Compressor"
        let shortDescription = "Gives an hour's worth of sleep in only 30 minutes."
        let imageURL = "http://www.google.com/404"
        let json = ["name":name,
                    "shortDescription":shortDescription,
                    "largeImage":imageURL]
        
        let item = WalmartItem(json: json)
        XCTAssertEqual(item.name, name)
        XCTAssertEqual(item.shortDescription, shortDescription)
        XCTAssertEqual(item.imageURL, imageURL)
    }
    
    func testItemMissingDataFromJSON() {
        let name = "iHammock"
        let json = ["name":name]
        
        let item = WalmartItem(json: json)
        XCTAssertEqual(item.name, name)
        XCTAssertEqual(item.shortDescription, "")
        XCTAssertEqual(item.imageURL, "")
    }
}
