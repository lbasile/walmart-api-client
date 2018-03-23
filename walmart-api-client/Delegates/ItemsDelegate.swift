//
//  ItemsDelegate.swift
//  walmart-api-client
//
//  Created by Louis Basile on 3/19/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import Foundation
import UIKit

class ItemsDelegate: NSObject, UITableViewDelegate {
    var fetchMoreItems: (() -> Void)?
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let threshold = contentHeight / 2
        if scrollView.contentOffset.y >= threshold {
            fetchMoreItems?()
        }
    }
}
