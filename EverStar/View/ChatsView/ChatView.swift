//
//  ChatView.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI
import PhotosUI

struct ChatView: View {
    var myID: String
    var data : Contact
    
    @State var showingImagePicker = false
    @State var showingActionSheet = false
    @State var write = ""
    
//    @ObservedObject private var keyboardHandler : KeyboardFollower
//
//
//
//    public init(keyboardHandler: KeyboardFollower, myID: String, data: Contact) {
//        self.keyboardHandler = keyboardHandler
//        self.myID = myID
//        self.data = data
//    }
    
    
    var body: some View {
        VStack {
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center){
                    ForEach(data.listMessages!, id:\.self) { message in
                        ChatRow(myID: "user0", message: message)
                        
                    }
                }.frame(width: 374)
                    
            }
            .scrollDismissesKeyboard(.interactively)
            
            
            HStack {
                cameraButtton
                TextField("message...",text: self.$write).padding(10)
                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                .cornerRadius(25)
                
                Button(action: {
                    if self.write.count > 0 {
//                        self.session.sendData(user: self.user, message: self.write)
                        self.write = ""
                    } else {
                        
                    }
                }) {
                    Image(systemName: "paperplane.fill").font(.system(size: 20))
                        .foregroundColor((self.write.count > 0) ? Color.blue : Color.gray)
                        .rotationEffect(.degrees(50))
                    
                }
            }
            .padding(.horizontal)
            .padding(.vertical,5)
        }
//        .padding(.bottom, keyboardHandler.keyboardHeight)
        .sheet(isPresented: $showingImagePicker,onDismiss: loadImage){
                SelectPhotoView()
            }
//        .actionSheet(isPresented: $showingActionSheet) {
//             ActionSheet(title: Text(""), buttons: [
//                 .default(Text("Choose Photo")) {
//                     self.sourceType = .photoLibrary
//                     self.showingImagePicker = true
//                 },
//                 .default(Text("Take Photo")) {
//                     self.sourceType = .camera
//                     self.showingImagePicker = true
//                 },
//                 .cancel()
//             ])
//         }
        
    }
    
    func loadImage() {
        
    }
    
    // cameraButton
    private var cameraButtton : Button<Image> {
        return Button(action: {
            self.showingImagePicker = true
        }){
            Image(systemName: "camera")
        }
    }
}





struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
//        ChatView(myID: "user0", data: Contact())
        SelectPhotoView()
    }
}

struct ChatRow: View {
    var myID: String
    var message: Message
    var body: some View {
        HStack {
            if message.messageUrl == "" {
                if message.fromID == myID {
                    txtMyMessage
                }
                else{
                    txtOtherMessage
                }
            } else {
                if message.fromID == myID {
                    imgMyMessage
                }
                else{
                    imgOtherMessage
                }
            }
        }
    }
    
    // if message is text
        // my message
    private var txtMyMessage: some View {
        HStack {
            Spacer()
            Text(message.content ?? "")
                .modifier(chatModifier(myMessage: true))
        }.padding(.leading, 75)
    }
        // not my message
    private var txtOtherMessage: some View {
        HStack {
            Text(message.content ?? "")
                .modifier(chatModifier(myMessage: false))
            Spacer()
        }.padding(.trailing, 75)
    }
    
    // if message is picture
        // my message
    private var imgMyMessage: some View {
        HStack {
            Spacer()
            AsyncImage(url: URL(string: message.messageUrl!))
                .aspectRatio(contentMode: .fit)
                .frame(idealWidth: 291, idealHeight: 291)
                .cornerRadius(10)
        }.padding(.leading, 75)
    }
        // not my message
    private var imgOtherMessage: some View {
        HStack {
            AsyncImage(url: URL(string: message.messageUrl!))
                .aspectRatio(contentMode: .fit)
                .frame(idealWidth: 291, idealHeight: 291)
                .cornerRadius(10)
            Spacer()
        }.padding(.trailing, 75)
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

struct SelectPhotoView: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {

        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()) {
//                Text("Select a photo")
                
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    // Retrieve selected asset in the form of Data
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
        
        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
        }
    }
}
