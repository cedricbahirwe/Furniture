//
//  ItemView.swift
//  Furniture
//
//  Created by Cédric Bahirwe on 05/02/2021.
//

import SwiftUI



struct Item: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var price: Int
    var lastPrice: Int
    var rate: Double
    var isFavorite: Bool = false
    var rateValue: String {
        get {
            String(format: "%.1f", rate)
        }
    }
}
struct ItemView: View {
    @Environment(\.colorScheme) var colorScheme
    let item : Item
    var body: some View {
        VStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            VStack(alignment: .leading) {
                Text(item.name)
                HStack {
                    Text("\(item.price)$")
                        .foregroundColor(.mainBlue)
                    Text("\(item.lastPrice)$")
                        .strikethrough()
                        .foregroundColor(.lightGray)
                    
                    Spacer()
                    
                    HStack {
                        ZStack {
                            Image("star")
                            Image("star-fill")
                        }
                        Text(item.rateValue)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
//        .padding(.top)
        .overlay(
            Image(systemName: "heart.fill")
                .foregroundColor(item.price%2 == 0 ? Color("mainBlue") : Color.black.opacity(0.1))
                .colorScheme(.dark), alignment: .topTrailing
        )
        .padding()
        .background(Color.white.opacity(colorScheme == .light ? 1.0 : 0.03))
        .cornerRadius(12)
        .shadow(color: .lightShadow, radius: 8, x: -8, y: -8)
        .shadow(color: .darkShadow, radius: 8, x: 8, y: 8)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: Item(image: "chair1", name: "Classic Chair", price: 40, lastPrice: 45, rate: 4.7))
            .padding()
    }
}
