//
//  ShadowView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ShadowView: View {
    
    @State private var radius: CGFloat = 5.0
    @State private var x: CGFloat = 0
    @State private var y: CGFloat = 0
    
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
            
            InfoView(title: "Radius :  \(radius.oneDecimalString())") {
                Slider(value: $radius, in: 0...100)
            }
            InfoView(title: "X :  \(x.oneDecimalString())") {
                Slider(value: $x, in: 0...100)
            }
            InfoView(title: "Y :  \(y.oneDecimalString())") {
                Slider(value: $y, in: 0...100)
            }
        }
    }
}

#Preview {
    ShadowView()
}
