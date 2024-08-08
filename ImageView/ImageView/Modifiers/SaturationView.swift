//
//  SaturationView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct SaturationView: View {
    
    @State private var amount: CGFloat = 1.0
    
    var body: some View {
        VStack {
            SharedImageView(modifier: .saturation) { image in
                Image(image)
                    .resizable()
                    .saturation(amount)
                    .frame(width: 300, height: 300, alignment: .center)
            }
            
            InfoView(title: "Amount : \(String(format: "%.1f", amount))") {
                Slider(value: $amount, in: 0...10)
            }
        }
    }
}

#Preview {
    SaturationView()
}
