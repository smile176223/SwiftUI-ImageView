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

extension Alignment: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .top:
            hasher.combine(0)
        case .topLeading:
            hasher.combine(1)
        case .topTrailing:
            hasher.combine(2)
        case .bottom:
            hasher.combine(3)
        case .bottomLeading:
            hasher.combine(4)
        case .bottomTrailing:
            hasher.combine(5)
        case .leading:
            hasher.combine(6)
        case .leadingLastTextBaseline:
            hasher.combine(7)
        case .leadingFirstTextBaseline:
            hasher.combine(8)
        case .trailing:
            hasher.combine(9)
        case .trailingLastTextBaseline:
            hasher.combine(10)
        case .trailingFirstTextBaseline:
            hasher.combine(11)
        case .center:
            hasher.combine(12)
        case .centerLastTextBaseline:
            hasher.combine(13)
        case .centerFirstTextBaseline:
            hasher.combine(14)
        default:
            hasher.combine(99)
        }
    }
}

extension Alignment: Identifiable {
    public var id: Self { self }
}

extension Alignment {
    var name: String {
        switch self {
        case .top:
            return "top"
        case .topLeading:
            return "topLeading"
        case .topTrailing:
            return "topTrailing"
        case .bottom:
            return "bottom"
        case .bottomLeading:
            return "bottomLeading"
        case .bottomTrailing:
            return "bottomTrailing"
        case .leading:
            return "leading"
        case .leadingLastTextBaseline:
            return "leadingLastTextBaseline"
        case .leadingFirstTextBaseline:
            return "leadingFirstTextBaseline"
        case .trailing:
            return "trailing"
        case .trailingLastTextBaseline:
            return "trailingLastTextBaseline"
        case .trailingFirstTextBaseline:
            return "trailingFirstTextBaseline"
        case .center:
            return "center"
        case .centerLastTextBaseline:
            return "centerLastTextBaseline"
        case .centerFirstTextBaseline:
            return "centerFirstTextBaseline"
        default:
            return "unknown"
        }
    }
}
