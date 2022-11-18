//
//  ContactView.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI
import TabBar
// dump data
let mes11 = Message(fromID: "user0", toID: "user1", content: " Message content Message content Message content", time: "01:01")
let mes12 = Message(fromID: "user1", toID: "user0", content: " Message content Message content Message content", time: "01:02")
let mes13 = Message(fromID: "user0", toID: "user1", content: " Message content Message content Message content", time: "01:03")
let mes14 = Message(fromID: "user1", toID: "user0", content: " Message content Message content Message content", time: "01:04")
let mes15 = Message(fromID: "user0", toID: "user1", content: " Message content Message content Message content", time: "01:05")


let mes21 = Message(fromID: "user0", toID: "user2", content: " Message content Message content Message content", time: "02:01")
let mes22 = Message(fromID: "user0", toID: "user2", content: " Message content Message content Message content", time: "02:02")
let mes23 = Message(fromID: "user0", toID: "user2", content: " Message content Message content Message content", time: "02:03")

let mes31 = Message(fromID: "user0", toID: "user3", content: " Message content Message content Message content", time: "03:01")
let mes32 = Message(fromID: "user0", toID: "user3", content: " Message content Message content Message content", time: "03:02")

let contact1 = Contact(id: "user1", name: "This is user 1", imageUrl: "dumpAvatar", listMessages: [mes11,mes12,mes13, mes14, mes15])
let contact2 = Contact(id:"user2", name: "This is user 2", imageUrl: "dumpAvatar2",  listMessages: [mes21, mes22, mes23])
let contact3 = Contact(id: "user3", name: "This is user 3", imageUrl: "dumpAvatar3", listMessages: [mes31, mes32])
let contact4 = Contact(id: "user4", name: "This is user 4")
let contact5 = Contact(id: "user5", name: "This is user 5")
let contact6 = Contact(id: "user6", name: "This is user 6")
let contact7 = Contact(id: "user7", name: "This is user 7")
let contact8 = Contact(id: "user8", name: "This is user 8")
let contact9 = Contact(id: "user9", name: "This is user 9")


// dump data



struct ContactView: View {
    
    @State var listContacts = [contact1, contact2, contact3, contact4, contact5, contact6, contact7, contact8, contact9]
    @Binding var tabBarVisibility : TabBarVisibility
    
    var body: some View {
        NavigationView {
            List(listContacts) { contact in
                
                NavigationLink(destination:
                    ChatView(myID: "user1", data: contact)
                    .onAppear(){
                        tabBarVisibility.toggle()
                    }
                    .onDisappear(){
                        tabBarVisibility.toggle()
                    }
                )
                {
                    ContactRow(contact: contact)
                }
            }.navigationBarTitle(Text("Contacts"))
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(tabBarVisibility: .constant(.visible))
    }
}

//row for contact screen
struct ContactRow: View {
    var contact : Contact
    var body: some View {
        HStack {
            Image(contact.imageUrl ?? "default")
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .clipped()
            
            Text((contact.name!)).font(.headline)
            Spacer()
            }
    }
}

