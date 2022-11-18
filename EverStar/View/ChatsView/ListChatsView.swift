//
//  ListChatsView.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI
import TabBar

struct ListChatsView: View {
    
    @State var listContacts = [contact1, contact2, contact3]
    @Binding var tabBarVisibility : TabBarVisibility

    var body: some View {
        NavigationView {
            List(listContacts) { contact in
                
                NavigationLink(destination:
                    ChatView(myID: "user0", data: contact)
                    .onAppear(){
                        tabBarVisibility.toggle()
                    }
                    .onDisappear(){
                        tabBarVisibility.toggle()
                    }
                )
                {
                    ListChatsRow(contact: contact)
                }
            }
            .navigationBarTitle(Text("Contacts"))
        }
    }
}

struct ListChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ListChatsView(tabBarVisibility: .constant(.visible))
    }
}

//row for contact screen
struct ListChatsRow: View {
    var contact : Contact
    var body: some View {
        HStack {
            Image(contact.imageUrl ?? "default")
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .clipped()
            
            VStack(alignment: .leading) {
                Text((contact.name!)).font(.headline)
                HStack {
                    Text((contact.listMessages?.first?.content)!)
                        .font(.subheadline)
                        .frame(height: 30)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text((contact.listMessages?.first?.time)!).font(.subheadline)
                }
            }
            
            Spacer()
            
                Image(systemName: "star.fill")
                    .font(.headline)
                    .foregroundColor(.yellow)
        }
    }
}

