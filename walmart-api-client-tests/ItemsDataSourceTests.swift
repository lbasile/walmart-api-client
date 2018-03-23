//
//  ItemsDataSourceTests.swift
//  walmart-api-client-tests
//
//  Created by Louis Basile on 3/18/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import XCTest
@testable import walmart_api_client

class ItemsDataSourceTests: XCTestCase {
    var datasource: ItemsDataSource!
    var item1: WalmartItem!
    var item2: WalmartItem!
    let tableview = UITableView()
    let identifier = "cell"
    
    override func setUp() {
        super.setUp()
        item1 = WalmartItem(name: "iPod", shortDescription: "description", imageURL: "imageURL")
        item2 = WalmartItem(name: "wallet", shortDescription: "description of wallet", imageURL: "walletImageURL")
        datasource = ItemsDataSource(cellIdentifier: identifier)
        datasource.items = [item1, item2]
        tableview.register(UINib(nibName: "ItemTableViewCell", bundle: Bundle(for: ItemTableViewCell.self)), forCellReuseIdentifier: identifier)
    }
    
    func testExpectedDataSourceCount() {
        XCTAssertEqual(datasource.tableView(tableview, numberOfRowsInSection: 0), 2)
    }
    
    func testDataSourceCountWithNoItems() {
        let datasource = ItemsDataSource(cellIdentifier: identifier)
        XCTAssertEqual(datasource.tableView(tableview, numberOfRowsInSection: 0), 0)
    }
    
    func testCellProperties() {
        let cell = datasource.tableView(tableview, cellForRowAt: IndexPath(row: 0, section: 0)) as! ItemTableViewCell
        XCTAssertEqual(cell.nameLabel.text, "iPod")
        XCTAssertEqual(cell.descriptionLabel.text, "description")
    }
}
