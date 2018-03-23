//
//  Coordinator.swift
//  walmart-api-client
//
//  Created by Louis Basile on 3/15/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import Foundation
import UIKit

class ItemsCoordinator: Coordinator {
    let apiManager: WalmartAPIManager
    let dataSource: ItemsDataSource
    let delegate: ItemsDelegate
    var isFetching = false
    var isLoading: (() -> Void)?
    var doneLoading: (() -> Void)?
    var numItems = 25
    var start = 1
    weak private var viewController: ItemsViewController?
    weak var tableView: UITableView?
    
    init(apiManager: WalmartAPIManager = WalmartAPIManager(),
         dataSource: ItemsDataSource = ItemsDataSource(cellIdentifier: "Cell"), delegate: ItemsDelegate = ItemsDelegate()) {
        self.apiManager = apiManager
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    func attach(viewController: UIViewController) {
        self.viewController = viewController as? ItemsViewController
    }
    
    func viewDidLoad() {
        tableView = viewController?.tableView
        tableView?.dataSource = dataSource
        tableView?.delegate = delegate
        delegate.fetchMoreItems = { [weak self] in
            guard let weakSelf = self else { return }
            if !weakSelf.isFetching {
                weakSelf.start += weakSelf.numItems
                weakSelf.fetchData(start: weakSelf.start)
            }
        }
    }
    
    func viewWillAppear() {
        fetchData(start: start)
    }
    
    func fetchData(start: Int) {
        isFetching = true
        isLoading?()
        apiManager.search("ipod", numItems: numItems, start: start) { [weak self] (items) in
            DispatchQueue.main.async {
                guard let weakSelf = self, let items = items else { return }
                weakSelf.doneLoading?()
                weakSelf.isFetching = false
                weakSelf.dataSource.items.append(contentsOf: items)
                weakSelf.tableView?.reloadData()
            }
        }
    }
}
