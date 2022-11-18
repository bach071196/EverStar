//
//  LoginView.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLogin : Bool
    
    @State var account = ""
    @State var password = ""
    @State var showingAlert = false
    
    @State var alertTitle : String = "Uh Oh 🙁"
    @State var error : String = ""

    
    var body: some View {
        NavigationView{
            VStack {
                Image("logoIC")
                    .resizable()
                    .frame(width: 240, height: 100)
                    .padding([.top, .bottom])
                    
                VStack(spacing: 18){
                    Group{
                        TextField("Account address", text: $account)
                        SecureField("Password", text: $password)
                    }
                    .modifier(CustomTextField())
                }.padding(.top,10)
                    .padding(.bottom,50)
                
                Button(action: signIn){
                    Text("SIGN IN")
                        .modifier(CustomButton())
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
                }
                Spacer()
                Button(action: signIn){
                    Text("SIGN IN WITH FACEBOOK")
                        .modifier(CustomButton())
                }
                .padding(.bottom)
                Button(action: signIn){
                    Text("SIGN IN WITH GOOGLE")
                        .modifier(CustomButton())
                }
                .padding(.bottom)
                Button(action: signIn){
                    Text("SIGN IN WITH APPLE ID")
                        .modifier(CustomButton())
                }
                .padding(.bottom,80)
                
            }
            .padding(.horizontal, 32)
        }
    }
    
    func signIn() {
        isLogin = true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLogin: .constant(false))
    }
}
