//
//  ContentView.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State var isLogin = false
    var body: some View {
        Group{
            if (isLogin){
                MainView()
            }
            else{
                LoginView(isLogin: $isLogin)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
