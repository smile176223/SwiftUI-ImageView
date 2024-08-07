//
//  ModifierList.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ModifierList: View {
    
    private let modifiers = [
        "resizable(capInsets:resizingMode:)",
        "scaledToFit()",
        "scaledToFill()",
        "aspectRatio(_:contentMode:)",
        "frame(width:height:alignment:)",
        "clipShape(_:)",
        "cornerRadius(_:)",
        "opacity(_:)",
        "shadow(color:radius:x:y:)",
        "overlay(_:alignment:)",
        "border(_:width:)",
        "background(_:)",
        "blendMode(_:)",
        "brightness(_:)",
        "contrast(_:)",
        "saturation(_:)",
        "hueRotation(_:)",
        "grayscale(_:)",
        "blur(radius:opaque:)",
        "rotationEffect(_:anchor:)",
    ]
    
    private var searchResults: [String] {
        if searchText.isEmpty {
            return modifiers
        } else {
            return modifiers.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { modifier in
                    NavigationLink {
                        
                    } label: {
                        Text(modifier)
                            .font(.system(size: 16))
                            .bold()
                    }
                    .padding()
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                    )
                    
                }
            }
            .listStyle(PlainListStyle())
            .padding([.top, .bottom], 5)
            .navigationTitle("Image Modifiers")
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .animation(.default, value: searchResults)
    }
}

#Preview {
    ModifierList()
}
