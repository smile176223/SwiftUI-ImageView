//
//  BackgroundView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct BackgroundView: View {
    
    private let alignments: [Alignment] = [
        .top,
        .topLeading,
        .topTrailing,
        .bottom,
        .bottomLeading,
        .bottomTrailing,
        .leading,
        .leadingLastTextBaseline,
        .leadingFirstTextBaseline,
        .trailing,
        .trailingLastTextBaseline,
        .trailingFirstTextBaseline,
        .center,
        .centerLastTextBaseline,
        .centerFirstTextBaseline,
    ]
    @State private var alignment: Alignment = .center
    
    @State private var width: CGFloat = 1
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .background) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .background(alignment: alignment) {
                            Color.red
                                .frame(width: 350, height: 350)
                        }
                }
                .frame(width: 300, height: 300)
                .padding()
            }
            
            Menu {
                Picker("alignment", selection: $alignment) {
                    ForEach(alignments) { alignment in
                        Text("\(alignment.name)")
                    }
                }
            } label: {
                Text(alignment.name)
                    .font(.title)
                    .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    BackgroundView()
}
