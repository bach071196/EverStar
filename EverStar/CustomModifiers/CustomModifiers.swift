//
//  CustomModifiers.swift
//  EverStar
//
//  Created by bach on 16/11/2022.
//

import SwiftUI
import TabBar

struct CustomTextField : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size:14))
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.systemPink), lineWidth: 1 ))
    }
}

struct CustomButton : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 50)
            .foregroundColor(.white)
            .font(.system(size:14, weight: .bold))
            .background(LinearGradient(gradient: Gradient(colors: [Color(.black),Color(.systemPurple)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15)
    }
}

struct CustomTabBarStyle: TabBarStyle {
    
    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        itemsContainer()
            .background(Color("color.tab.bar.background"))
            .cornerRadius(25.0)
            .frame(height: 60.0)
            .padding(.horizontal, 40.0)
            .padding(.bottom, 16.0 + geometry.safeAreaInsets.bottom)
    }
    
}

struct CustomTabItemStyle: TabItemStyle {
    
    public func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        ZStack {
            if isSelected {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 50)
            }
            
            Image(systemName: icon)
                .foregroundColor(isSelected ? .white : Color("color.tab.item.foreground"))
                .frame(width: 40, height: 40)
                
        }
        .padding(.vertical, 8.0)
    }
    
}
