//
//  RotationEffectView.swift
//  ImageView
//
//  Created by Liam on 2024/8/9.
//

import SwiftUI

struct RotationEffectView: View {
    
    @State private var degrees: CGFloat = 0.0
    @State private var anchor: UnitPoint = .center
    
    var body: some View {
        VStack {
            SharedImageView(modifier: .rotationEffect) { image in
                Image(image)
                    .resizable()
                    .rotationEffect(.degrees(degrees), anchor: anchor)
                    .frame(width: 300, height: 300)
            }
            
            Menu {
                Picker("anchor", selection: $anchor) {
                    ForEach(UnitPoint.allCases) { alignment in
                        Text("\(alignment.name)")
                    }
                }
            } label: {
                Text(anchor.name)
                    .font(.title)
                    .foregroundStyle(.primary)
            }
            .padding()
            
            InfoView(title: "Degrees : \(Int(degrees))") {
                Slider(value: $degrees, in: 0...360)
            }
        }
    }
}

#Preview {
    RotationEffectView()
}

extension UnitPoint: CaseIterable, Identifiable {
    public static var allCases: [UnitPoint] = [
        .topLeading,
        .top,
        .topTrailing,
        .leading,
        .center,
        .trailing,
        .bottomLeading,
        .bottom,
        .bottomTrailing
    ]
    
    public var id: Self { self }
    
    public var name: String {
        switch self {
        case .topLeading:
            return "topLeading"
        case .top:
            return "top"
        case .topTrailing:
            return "topTrailing"
        case .leading:
            return "leading"
        case .center:
            return "center"
        case .trailing:
            return "trailing"
        case .bottomLeading:
            return "bottomLeading"
        case .bottom:
            return "bottom"
        case .bottomTrailing:
            return "bottomTrailing"
        default:
            return "unknown"
        }
    }
    
}
