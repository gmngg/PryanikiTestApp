//
//  Assembly.swift
//  pryanikyTestApp
//
//  Created by Georgij Malygin on 29/07/2020.
//  Copyright © 2020 Georgij Malygin. All rights reserved.
//

import UIKit

protocol AssemblyInterface {
    static func start() -> UIViewController
}

class Assembly: AssemblyInterface {
    static func start() -> UIViewController {
        let vc = SingleViewController()
        let network = NetworkService()
        let presenter = ViewPresenter(view: vc, network: network)
        vc.presenter = presenter
        return vc
    }
}
