//
//  walmart_api_client_tests.swift
//  walmart-api-client-tests
//
//  Created by Louis Basile on 3/15/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import XCTest
@testable import walmart_api_client

class WalmartAPIManagerTests: XCTestCase {
    let manager = WalmartAPIManager(downloader: JSONDownloaderMock())

    func testGetOneItem() {
        let promise = expectation(description: "walmart search success")
        manager.search("ipod", numItems: 1, start: 1) { (items) in
            guard let items = items, let item = items.first else { return }
            XCTAssertEqual(item.name, "Apple iPod touch")
            XCTAssertEqual(item.shortDescription, "a short description")
            promise.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}

class JSONDownloaderMock: JSONDownloader {
    convenience init() {
        self.init(session: URLSession(configuration: .default))
    }
    override func getJSON(url: URL, completionHandler: @escaping (Any?) -> Void) {
        let itemJSON = [["name": "Apple iPod touch", "shortDescription": "a short description"],
                        ["name": "Two", "shortDescription": "a short description"],
                        ["name": "Three", "shortDescription": "a short description"],
                        ["name": "Four", "shortDescription": "a short description"],
                        ["name": "Five"],
                        ["name": "Six", "shortDescription": "a short description"],
                        ["name": "Seven", "shortDescription": "a short description"],
                        ["name": "Eight", "shortDescription": "a short description"],
                        ["name": "Nine", "shortDescription": "a short description"]]
        let response = ["items":itemJSON]
        completionHandler(response)
    }
}

