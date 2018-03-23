//
//  JSONDownloaderTests.swift
//  walmart-api-client-tests
//
//  Created by Louis Basile on 3/15/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import XCTest
@testable import walmart_api_client

class JSONDownloaderTests: XCTestCase {
    let downloader = JSONDownloader()
    
    func testDownloadSucceeds() {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "networkTest", withExtension: "json")!
        let promise = expectation(description: "Test Download Success")
        downloader.getJSON(url: url) { (jsonObject) in
            guard let _ = jsonObject as? [String: Any] else { return }
            promise.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testDownloadFailsInvalidJSON() {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "invalid", withExtension: "json")!
        let promise = expectation(description: "Test Download Bad JSON")
        downloader.getJSON(url: url) { (jsonObject) in
            guard jsonObject == nil else { return }
            promise.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testDownloadFailsBadResource() {
        // NOTE: actual network call could be mocked
        let url = URL(string: "https://www.google.com/404")!
        let promise = expectation(description: "Test Download Fails")
        downloader.getJSON(url: url) { (jsonObject) in
            guard jsonObject == nil else { return }
            promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
