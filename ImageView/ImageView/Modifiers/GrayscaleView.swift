//
//  GrayscaleView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct GrayscaleView: View {
    
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            SharedImageView(modifier: .grayscale) { image in
                Image(image)
                    .resizable()
                    .grayscale(amount)
                    .frame(width: 300, height: 300)
            }
            
            InfoView(title: "Amount : \(amount.oneDecimalString())") {
                Slider(value: $amount, in: 0...20)
            }
        }
    }
}

#Preview {
    GrayscaleView()
}
