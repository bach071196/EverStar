//
//  ContactRow.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI

struct ContactRow: View {
    var contact : Contact
    var body: some View {
        HStack {
            Image("dumpAvatar")
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .clipped()
            
            VStack(alignment: .leading) {
                Text((contact.name!)).font(.headline)
                HStack {
                    Text((contact.listMesseages?.first?.content)!).font(.subheadline)
                    Spacer()
                    Text((contact.listMesseages?.first?.time)!).font(.subheadline)
                }
            }
            
            Spacer()
            
                Image(systemName: "star.fill")
                    .font(.headline)
                    .foregroundColor(.yellow)
        }
    }
}

//struct ContactRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactRow(contact: Contact())
//    }
//}
