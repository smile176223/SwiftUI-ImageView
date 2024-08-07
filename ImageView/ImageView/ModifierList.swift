//
//  ModifierList.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ModifierList: View {
    
    private var modifiers: [Modifier] = [
        .resizable,
        .scaledToFit,
        .scaledToFill,
        .aspectRatio,
        .frame,
        .clipShape,
        .cornerRadius,
        .opacity,
        .shadow,
        .overlay,
        .border,
        .background,
        .blendMode,
        .brightness,
        .contrast,
        .saturation,
        .hueRotation,
        .grayscale,
        .blur,
        .rotationEffect
    ]
    
    private var searchResults: [Modifier] {
        if searchText.isEmpty {
            return modifiers
        } else {
            return modifiers.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { modifier in
                    NavigationLink(value: modifier) {
                        Text(modifier.title)
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
            .navigationDestination(for: Modifier.self) { $0.view() }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .animation(.default, value: searchResults)
    }
}

#Preview {
    ModifierList()
}
