//
//  ProductDetailView.swift
//  Furniture
//
//  Created by Cédric Bahirwe on 05/02/2021.
//

import SwiftUI

struct ProductDetailView: View {
    let item: Item
    var animation: Namespace.ID

    @State private var selectedColor = Color("Color-1")
    
    @State private var colors: [Color] = [String](repeating: "", count: 5).enumerated().map({ return Color("Color-\($0.offset+1)")  })
    
//    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 15, height: 25)
                    .foregroundColor(Color(.label))
                    .onTapGesture {
                        withAnimation(.spring()) {
//                            presentationMode.wrappedValue.dismiss()
                            isPresented.toggle()
                        }
                    }
                
                
                Spacer()
                Image("vr")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 25)
                    .foregroundColor(Color(.label))
            }
            .padding()
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .matchedGeometryEffect(id: "chair", in: animation)
//                .frame(width: UIScreen.main.bounds.size.width*0.6)
                .frame(width: 300, height: 250)
                .hidden()
                .background(
                    
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "chair\(item.id)", in: animation)
//                        .frame(width: UIScreen.main.bounds.size.width*0.6)
                        .frame(width: 300, height: 250)

                )
            
            ZStack(alignment: .top) {
                Color.mainBackground
                    .cornerRadius(30)
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.name)
                                .font(.headline)
                                .fontWeight(.semibold)
                            Spacer()
                            
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.lightGray)
                        }
                        HStack {
                            HStack(alignment: .bottom, spacing: 3) {
                                Text("\(item.price)$")
                                    .foregroundColor(.mainBlue)
                                Text("\(item.lastPrice)$")
                                    .strikethrough()
                                    .foregroundColor(.lightGray)
                                    .font(.system(size: 14))
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 3) {
                                ZStack {
                                    Image("star")
                                    Image("star-fill")
                                }
                                Text(item.rateValue)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                            }
                        }
                    }
                    .padding()
                    .matchedGeometryEffect(id: "info\(item.id)", in: animation)
                    .frame(width: 300, height: 100)
                    .background(Color(.systemBackground))
                    .cornerRadius(25)
                    .shadow(color: .lightShadow, radius: 8, x: -4, y: 4)
                    .shadow(color: .darkShadow, radius: 8, x: 4, y: 4)
                    .padding(.horizontal, 30)
                    .padding(.top, -50)
                    
                    VStack(alignment: .leading) {
                        Text("COLOR")
                            .font(.callout)
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 20) {
                            ForEach(colors, id: \.self) { color in
                                color
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(8)
                                    .overlay(
                                        ZStack {
                                            if selectedColor == color {
                                                Image(systemName: "checkmark")
                                                    .resizable()
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .heavy))
                                                    .padding(10)
                                                    .onTapGesture {
                                                        selectedColor =  color
                                                    }
                                            }
                                        }
                                    )
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("DETAILS")
                            .font(.callout)
                            .fontWeight(.semibold)
                        
                        Text("Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est")
                            .foregroundColor(.lightGray)
                            .lineSpacing(8)
                            .font(.system(size: 16))
                    }
                    
                    HStack {
                        Image(systemName: "suit.heart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(10)
                            .frame(width: 45, height: 45)
                            .foregroundColor(.mainBlue)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .lightShadow, radius: 8, x: -4, y: 4)
                            .shadow(color: .darkShadow, radius: 8, x: 4, y: 4)

                        Button(action: {}, label: {
                            Text("ADD TO MY CART")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(Color.mainBlue)
                                .cornerRadius(8)
                                .shadow(color: .lightShadow, radius: 8, x: -8, y: 8)
                                .shadow(color: .darkShadow, radius: 8, x: 8, y: 8)
                        })
                    }
                    
                }
                .padding()
            }
        }
        
    }
    
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView(item: Item.example, isPresented: .constant(true))
//        //            .environment(\.colorScheme, .dark)
//    }
//}

extension View {
    func applyRedaction() -> some View {
        return Group {
            if #available(iOS 14.0, *) {
                self.redacted(reason: .placeholder)
            } else {
                self
                // Fallback on earlier versions
            }
        }
        
    }
}
