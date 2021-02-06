//
//  TopHeaderView.swift
//  Furniture
//
//  Created by Cédric Bahirwe on 05/02/2021.
//

import SwiftUI

struct TopHeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Button(action: {}, label: {
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                })
                TextField("What you are looking for", text: .constant(""))
                    .padding()
                    .frame(height: 33)
                    .overlay(
                        ZStack(alignment: .trailing) {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.lightGray, lineWidth: 0.7)
                            
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(8)
                                .frame(width: 30, height: 30)
                        }
                    )
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.lightGray)
                Button(action: {}, label: {
                    Image(systemName: "bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(.label))
                })
            }
            .padding(.horizontal)
            TabBarView()
            //                .padding()
            //                .background(Color.red)
            
        }
        .padding(.top)
        .background(
            ZStack {
                if colorScheme == .light {
                    Color.white.ignoresSafeArea(.all, edges: .top)
                        .shadow(radius: 0.5)
                } else {
                    Color.mainBackground.ignoresSafeArea(.all, edges: .top)
                        .shadow(color: .darkShadow, radius: 8, x: -8, y: -8)
                }
            }
        )
    }
}

struct TopHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TopHeaderView()
            Spacer()
            
        }
    }
}
