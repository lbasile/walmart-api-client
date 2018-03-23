//
//  ItemsDataSource.swift
//  walmart-api-client
//
//  Created by Louis Basile on 3/18/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ItemsDataSource: NSObject, UITableViewDataSource {
    var items: [WalmartItem] = []
    let cellIdentifier: String
    
    required init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
        let item = items[indexPath.row]
        cell.nameLabel.text = item.name
        cell.descriptionLabel.text = item.shortDescription
        cell.itemImageView.contentMode = .scaleAspectFit
        cell.itemImageView.kf.setImage(with: URL(string: item.imageURL))
        return cell
    }
}
