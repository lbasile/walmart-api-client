//
//  CoordinatorProtocol.swift
//  walmart-api-client
//
//  Created by Louis Basile on 3/15/18.
//  Copyright © 2018 Louis Basile. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    func attach(viewController: UIViewController)
    func viewDidLoad()    // optionally called by VC
    func viewWillAppear() // optionally called by VC
    func viewDidAppear()  // optionally called by VC
}

// default implementation of Coordinator
extension Coordinator {
    func viewDidLoad() { }
    func viewWillAppear() { }
    func viewDidAppear() { }
}
