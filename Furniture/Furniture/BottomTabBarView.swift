//
//  BottomTabBarView.swift
//  Furniture
//
//  Created by Cédric Bahirwe on 06/02/2021.
//

import SwiftUI


struct TabBarItem: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    
    static let tabs = [
        TabBarItem(image: "house", title: "Home"),
        TabBarItem(image: "square.grid.2x2", title: "Categories"),
        TabBarItem(image: "suit.heart", title: "Favourites"),
        TabBarItem(image: "line.horizontal.3", title: "Settings"),
    ]
}
struct BottomTabBarView: View {
    @State private var tabItems: [TabBarItem] = TabBarItem.tabs
    
    @State private var selectedTabItem: TabBarItem = TabBarItem.tabs.first!
    var body: some View {
        HStack {
            
            ForEach(tabItems) { tabBarItem in
                HStack {
                    Image(systemName: tabBarItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(2)
                        .frame(width: 22, height: 22)
                    if tabBarItem.id == selectedTabItem.id {
                        Text(tabBarItem.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
                .foregroundColor(
                    selectedTabItem.id == tabBarItem.id ? .mainBlue : .lightGray
                )
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        selectedTabItem = tabBarItem
                    }
                }
                if tabBarItem.id != tabItems.last!.id {
                    Spacer(minLength: 0)
                }
            }
        }
        .padding()
        .padding(.horizontal)
        .background(
            Color.mainBackground.cornerRadius(20, corners: [.topLeft, .topRight])
                .ignoresSafeArea(.all, edges: .bottom)
                .shadow(radius: 1)
        )
    }
}

struct BottomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBarView()
            .environment(\.colorScheme, .dark)
    }
}
