//
//  ModifierList.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ModifierList: View {
    
    private enum SectionItem: Hashable {
        case size([Modifier])
        case effect([Modifier])
    }
    
    private var sizeModifiers: [Modifier] = [
        .resizable,
        .scaledToFit,
        .scaledToFill,
        .aspectRatio,
        .frame,
        .clipShape,
        .cornerRadius,
    ]
    
    private var effectModifiers: [Modifier] = [
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
    
    private var searchResults: [SectionItem] {
        if searchText.isEmpty {
            return [
                .size(sizeModifiers),
                .effect(effectModifiers)
            ]
        } else {
            return [
                .size(sizeModifiers.filter { $0.title.lowercased().contains(searchText.lowercased()) }),
                .effect(effectModifiers.filter { $0.title.lowercased().contains(searchText.lowercased()) })
            ]
        }
    }
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { section in
                    switch section {
                    case let .size(modifiers):
                        items(sectionTitle: "Size", modifiers: modifiers)
                        
                    case let .effect(modifiers):
                        items(sectionTitle: "Effect", modifiers: modifiers)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .padding([.top, .bottom], 5)
            .navigationTitle("Image Modifiers")
            .navigationDestination(for: Modifier.self) { modifier in
                List {
                    modifier.view()
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .animation(.default, value: searchResults)
    }
    
    @ViewBuilder
    private func items(sectionTitle: String, modifiers: [Modifier]) -> some View {
        Section {
            ForEach(modifiers, id: \.self) { modifier in
                NavigationLink(value: modifier) {
                    Text(modifier.title)
                        .foregroundStyle(.black)
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
        } header: {
            Text(sectionTitle)
                .bold()
                .font(.title2)
        }
    }
}

#Preview {
    ModifierList()
}
