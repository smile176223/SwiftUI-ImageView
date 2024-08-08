//
//  CornerRadiusView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct CornerRadiusView: View {
    
    @State private var cornerRadius: CGFloat = 25
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .cornerRadius) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .cornerRadius(cornerRadius)
                }
                .frame(width: 300, height: 300)
                .border(.orange, width: 3)
                .padding()
            }
            
            InfoView(title: "CornerRadius :  \(Int(cornerRadius))") {
                Slider(value: $cornerRadius, in: 0...150)
            }
        }
    }
}

#Preview {
    CornerRadiusView()
}
