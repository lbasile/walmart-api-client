//
//  ViewController.swift
//  walmart-api-client
//
//  Created by Louis Basile on 3/12/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    var coordinator: ItemsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator?.viewDidLoad()
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.viewWillAppear()
    }
}

extension ItemsViewController {
    func attach(coordinator: ItemsCoordinator) {
        self.coordinator = coordinator
        coordinator.attach(viewController: self)
        coordinator.isLoading = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.loadingSpinner.startAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        coordinator.doneLoading = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.loadingSpinner.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

