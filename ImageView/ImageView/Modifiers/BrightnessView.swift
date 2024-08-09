//
//  BrightnessView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct BrightnessView: View {
    
    @State private var brightness: CGFloat = 0.0
    
    var body: some View {
        
        VStack {
            SharedImageView(modifier: .brightness) { image in
                Image(image)
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                    .brightness(brightness)
            }
            
            InfoView(title: "Brightness : \(brightness.oneDecimalString())") {
                Slider(value: $brightness, in: 0...1)
            }
            
        }
    }
}

#Preview {
    BrightnessView()
}
