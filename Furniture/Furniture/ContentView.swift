//
//  ContentView.swift
//  Furniture
//
//  Created by Cédric Bahirwe on 05/02/2021.
//

import SwiftUI

let deigner = "https://dribbble.com/mohamedsalahfathy"

struct ContentView: View {
    let chairs: [Item] = [
        Item(image: "chair1", name: "Classic Chair", price: 40, lastPrice: 55, rate: 4.7),
        Item(image: "chair2", name: "High Chair", price: 35, lastPrice: 45, rate: 4.3),
        Item(image: "chair3", name: "Haptic Chair", price: 40, lastPrice: 45, rate: 4.0),
        Item(image: "chair4", name: "Comfert Chair", price: 50, lastPrice: 55, rate: 4.9),
        Item(image: "chair5", name: "Elegant Chair", price: 30, lastPrice: 35, rate: 4.8),
        Item(image: "chair6", name: "Luxury Chair", price: 65, lastPrice: 80, rate: 4.7),
    ]
    
    var body: some View {
        VStack {
            TopHeaderView()
            ScrollView(showsIndicators: false) {
                VStack {
                    GridStack(rows: 3, columns: 2) { row, column in
                        ItemView(item: chairs[indexFor(row, column)])
                    }
                }
                .padding()
            }
        }
        .applyBackground()
    }
    
    private func indexFor(_ row: Int, _ column: Int) -> Int {
        return  row * 3 + column
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            ForEach(0 ..< columns, id: \.self) { row in
                VStack(spacing: 15) {
                    ForEach(0 ..< self.rows, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}



extension View {
    func applyBackground() -> some View {
        return ZStack {
            Color("mainBackground").edgesIgnoringSafeArea(.all)
            self
        }
    }
    
}
