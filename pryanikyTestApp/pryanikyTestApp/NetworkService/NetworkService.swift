//
//  NetworkService.swift
//  pryanikyTestApp
//
//  Created by Georgij Malygin on 27/07/2020.
//  Copyright © 2020 Georgij Malygin. All rights reserved.
//

import Foundation

protocol NetworkServiceInterface {
    func networkModel(compail: @escaping (Result<JSONModel?,Error>) ->())
}

class NetworkService: NetworkServiceInterface {
    func networkModel(compail: @escaping (Result<JSONModel?, Error>) -> ()) {
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response ,error in
            if let error = error {
                compail(
                    .failure(error)
                )
                return
            }
            guard let data = data else {
                return
            }
                do {
                let model = try JSONDecoder().decode(JSONModel.self, from: data)
                compail(
                    .success(model))
                } catch {
                compail(
                    .failure(error)
                )
                }
            }.resume()
    }
}
