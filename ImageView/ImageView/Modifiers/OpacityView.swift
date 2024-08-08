//
//  OpacityView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct OpacityView: View {
    
    @State private var opacity: Double = 0.5
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .opacity) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .opacity(opacity)
                }
                .frame(width: 300, height: 300)
                .border(.orange, width: 3)
                .padding()
            }
            
            InfoView(title: "opacity :  \(String(format: "%.1f", opacity))") {
                Slider(value: $opacity, in: 0...1)
            }
        }
    }
}

#Preview {
    OpacityView()
}
