//
//  AlertController.swift
//  pryanikyTestApp
//
//  Created by Georgij Malygin on 29/07/2020.
//  Copyright © 2020 Georgij Malygin. All rights reserved.
//

import UIKit

protocol AlertPresenterProtocol {
    func show(_ alert: UIAlertController)
}

extension SceneDelegate: AlertPresenterProtocol {
    func show(_ alert: UIAlertController) {
        guard let window = window?.rootViewController else {
            return
        }
        window.show(alert, sender: nil)
    }
}
