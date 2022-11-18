//
//  ChatView.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI

struct ChatView: View {
    var myID: String
    var data : Contact
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center){
                ForEach(data.listMessages!) { message in
                    ChatRow(myID: "user0", message: message)
                    
                }
            }.frame(width: 374)
        }
    }
    
    
    
   
}





struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(myID: "user0", data: Contact())
    }
}

struct ChatRow: View {
    var myID: String
    var message: Message
    var body: some View {
        HStack {
            if message.messageUrl != "" {
                imgMessage
            } else {
                txtMessage
            }
        }
    }
    
    // if message is text
    private var txtMessage: some View {
        HStack {
            Spacer()
            Text(message.content ?? "")
                .modifier(chatModifier(myMessage: myID == message.fromID))
        }.padding(myID == message.fromID ? .trailing : .leading,75)
    }
    
    // if message is picture
    private var imgMessage: some View {
        HStack {
            Spacer()
            AsyncImage(url: URL(string: message.messageUrl!))
                .aspectRatio(contentMode: .fit)
                .frame(idealWidth: 291, idealHeight: 291)
                .cornerRadius(10)
        }.padding(message.fromID == myID ? .trailing : .leading,75)
        
    }
}

struct chatModifier : ViewModifier{
    var myMessage : Bool
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(myMessage ? Color.blue : Color("bgFriendChat"))
            .cornerRadius(7)
            .foregroundColor(Color.white)
    }
}
