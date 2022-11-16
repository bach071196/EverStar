//
//  ContactView.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI

// dump data
let mes11 = Messeage(fromID: "user0", toID: "user1", content: " @EnvironmentObject var userData: UserData", time: "01:01")
let mes12 = Messeage(fromID: "user0", toID: "user1", content: " @EnvironmentObject var userData: UserData", time: "01:02")
let mes13 = Messeage(fromID: "user0", toID: "user1", content: " @EnvironmentObject var userData: UserData", time: "01:03")
let mes14 = Messeage(fromID: "user0", toID: "user1", content: " @EnvironmentObject var userData: UserData", time: "01:04")
let mes15 = Messeage(fromID: "user0", toID: "user1", content: " @EnvironmentObject var userData: UserData", time: "01:05")


let mes21 = Messeage(fromID: "user0", toID: "user2", content: " @EnvironmentObject var userData: UserData", time: "02:01")
let mes22 = Messeage(fromID: "user0", toID: "user2", content: " @EnvironmentObject var userData: UserData", time: "02:02")
let mes23 = Messeage(fromID: "user0", toID: "user2", content: " @EnvironmentObject var userData: UserData", time: "02:03")

let mes31 = Messeage(fromID: "user0", toID: "user3", content: " @EnvironmentObject var userData: UserData", time: "03:01")
let mes32 = Messeage(fromID: "user0", toID: "user3", content: " @EnvironmentObject var userData: UserData", time: "03:02")

let contact1 = Contact(id: "user1", name: "This is user 1", listMesseages: [mes11,mes12,mes13, mes14, mes15])
let contact2 = Contact(id:"user2", name: "This is user 2", listMesseages: [mes21, mes22, mes23])
let contact3 = Contact(id: "user3", name: "This is user 3", listMesseages: [mes31, mes32])

// dump data



struct ContactView: View {
    
    @State var listContacts = [contact1, contact2, contact3]
    
    var body: some View {
        NavigationView {
            List(listContacts) { contact in
                
                NavigationLink(destination:
                                ChatsView(data: contact)){
                    ContactRow(contact: contact)
                        
                }
            }.navigationBarTitle(Text("Contacts"))
        }    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
