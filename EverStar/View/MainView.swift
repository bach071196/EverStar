//
//  MainView.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI

import TabBar

struct MainView: View {
    
    private enum Item: Int, Tabbable {
        case first = 0
        case second
        case third
        
        var icon: String {
            switch self {
                case .first: return "person.2.fill"
                case .second: return "message.circle"
                case .third: return "ellipsis"
            }
        }
        
        var title: String {
            switch self {
                case .first: return "First"
                case .second: return "Second"
                case .third: return "Third"
            }
        }
    }
    
    @State private var selection: Item = .first
    @State private var visibility: TabBarVisibility = .visible
    
    var body: some View {
        TabBar(selection: $selection, visibility: $visibility) {
            ContactView(tabBarVisibility: $visibility)
                .tabItem(for: Item.first)
            
            ListChatsView(tabBarVisibility: $visibility)
                .tabItem(for: Item.second)
            
            Text("setting")
                .tabItem(for: Item.third)
        }
        .tabBar(style: CustomTabBarStyle())
        .tabItem(style: CustomTabItemStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
