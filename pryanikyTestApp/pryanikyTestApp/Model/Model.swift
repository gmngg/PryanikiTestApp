//
//  Net.swift
//  pryanikyTestApp
//
//  Created by Georgij Malygin on 26/07/2020.
//  Copyright © 2020 Georgij Malygin. All rights reserved.
//

import Foundation

struct JSONModel: Decodable {
    var data: [GeneralData]?
    var view: [String]?
}

struct GeneralData: Decodable {
    var name: String?
    var data: ContentData?
}

struct ContentData: Decodable {
    var text: String?
    var url: String?
    var selectedId: Int?
    var variants: [VariantsSelectors]?
}

struct VariantsSelectors: Decodable {
    var id: Int?
    var text: String?
}
