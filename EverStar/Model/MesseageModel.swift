//
//  MessageModel.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import Foundation

struct Message: Hashable, Identifiable {
    let id: String?
    let fromID: String?         // from user ID
    let toID: String?           // to user ID
    let content: String?
    let messageUrl: String?      // have value if message is a picture
    let time: String?
    init(id: String? = "", fromID: String? = "", toID: String? = "", content: String? = "dump messseage", messageUrl: String? = "", time: String? = "00:00") {
        self.id = id
        self.fromID = fromID
        self.toID = toID
        self.content = content
        self.messageUrl = messageUrl
        self.time = time
    }
}
