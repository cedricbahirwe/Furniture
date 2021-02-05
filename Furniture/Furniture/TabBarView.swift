//
//  TabBarView.swift
//  Furniture
//
//  Created by Cédric Bahirwe on 05/02/2021.
//

import SwiftUI

struct TabBarView: View {
    @State private var tabs: [String]  = [
        "Trending", "New", "Sale", "Most ordered", "For you"
    ]
    @State private var selectedTab = "Trending"
    
    @Namespace var animation: Namespace.ID
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Text(tab)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .foregroundColor(selectedTab == tab ?  .mainBlue : .lightGray)
                        .overlay(
                            ZStack {
                                if selectedTab == tab {
                                    Color("mainBlue")
                                        .frame(height: 5)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                } else {
                                    Color.clear
                                        .frame(height: 5)
                                }
                                
                            }, alignment: .bottom
                        )
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedTab = tab
                            }
                        }
                }
            }
            .font(.system(size: 16, weight: .light))
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

