//
//  Presenter.swift
//  pryanikyTestApp
//
//  Created by Georgij Malygin on 27/07/2020.
//  Copyright © 2020 Georgij Malygin. All rights reserved.
//

import Foundation

protocol ViewPresenterDecision {
    func success()
    func failure(error: Error)
}

protocol ViewPresenterInterface {
    init(view: ViewPresenterDecision, network: NetworkServiceInterface)
    func getModel()
    var model: JSONModel? {get set}
}

class ViewPresenter: ViewPresenterInterface {
    var model: JSONModel?
    var view: ViewPresenterDecision?
    let network: NetworkServiceInterface
    
    required init(view: ViewPresenterDecision, network: NetworkServiceInterface) {
        self.view = view
        self.network = network
        getModel()
    }
    
    func getModel() {
        network.networkModel { [weak self] result in
            guard let self = self else{
                return}
            DispatchQueue.main.async {
                switch result {
            case .success(let model):
                self.model = model
                self.view?.success()
            case .failure(let error):
                self.view?.failure(error: error)
            }
            }
        }
    }
}
