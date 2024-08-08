//
//  ShadowView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ShadowView: View {
    
    @State private var radius: Double = 5.0
    @State private var x: Double = 0
    @State private var y: Double = 0
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .shadow) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .shadow(radius: radius, x: x, y: y)
                }
                .frame(width: 300, height: 300)
                .padding()
            }
            
            InfoView(title: "Radius :  \(String(format: "%.1f", radius))") {
                Slider(value: $radius, in: 0...100)
            }
            InfoView(title: "X :  \(String(format: "%.1f", x))") {
                Slider(value: $x, in: 0...100)
            }
            InfoView(title: "Y :  \(String(format: "%.1f", y))") {
                Slider(value: $y, in: 0...100)
            }
        }
    }
}

#Preview {
    ShadowView()
}
