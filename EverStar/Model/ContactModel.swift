//
//  ContactModel.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import Foundation

struct Contact: Hashable, Identifiable {
    let id: String?
    let name: String?
    let imageUrl: String?
    let listMesseages: [Messeage]?
//    let lastName: String
//    let phone: String
//    let email: String
//    let street: String
//    let city: String
//    let state: String
//    let zip: String
//    let imageName: String
//    var isFavorite: Bool
    init(id: String? = "", name: String? = "", imageUrl: String? = "", listMesseages: [Messeage]? = []) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.listMesseages = listMesseages
    }
}
