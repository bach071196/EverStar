//
//  MesseageModel.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import Foundation

struct Messeage: Hashable, Identifiable {
    let id: String?
    let fromID: String?         // from user ID
    let toID: String?           // to user ID
    let content: String?
    let time: String?
    init(id: String? = "", fromID: String? = "", toID: String? = "", content: String? = "dump messseage", time: String? = "00:00") {
        self.id = id
        self.fromID = fromID
        self.toID = toID
        self.content = content
        self.time = time
    }
}
