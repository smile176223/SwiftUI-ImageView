//
//  HueRotationView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct HueRotationView: View {
    
    @State private var angle: CGFloat = 1
    
    var body: some View {
        VStack {
            SharedImageView(modifier: .saturation) { image in
                Image(image)
                    .resizable()
                    .hueRotation(.degrees(angle * 36))
                    .frame(width: 300, height: 300)
            }
            
            InfoView(title: "Angle : \(String(format: "%.1f", angle))") {
                Slider(value: $angle, in: 0...10)
            }
            
            HStack {
                ForEach(0..<6) {
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(
                                colors: [.blue, .red, .green]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                        .hueRotation(.degrees(Double($0 * 36)))
                        .frame(width: 30, height: 60, alignment: .center)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HueRotationView()
}
