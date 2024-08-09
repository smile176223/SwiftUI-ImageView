//
//  ContrastView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct ContrastView: View {
    
    @State private var amount: CGFloat = 1.0
    
    var body: some View {
        VStack {
            SharedImageView(modifier: .contrast) { image in
                Image(image)
                    .resizable()
                    .contrast(amount)
                    .frame(width: 300, height: 300, alignment: .center)
            }
            
            InfoView(title: "Amount : \(amount.oneDecimalString())") {
                Slider(value: $amount, in: 0...10)
            }
        }
    }
}

#Preview {
    ContrastView()
}
