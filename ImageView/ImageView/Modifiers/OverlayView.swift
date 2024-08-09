//
//  OverlayView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct OverlayView: View {
    
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
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .overlay) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .overlay(alignment: alignment) {
                            Text("OVERLAY")
                                .bold()
                                .font(.title)
                        }
                }
                .frame(width: 300, height: 300)
                .border(.orange, width: 3)
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
    OverlayView()
}
