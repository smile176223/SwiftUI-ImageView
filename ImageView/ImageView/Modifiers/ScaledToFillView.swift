//
//  ScaledToFillView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ScaledToFillView: View {
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .scaledToFill) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 300, height: 300)
                .border(.orange, width: 3)
                .padding()
            }
        }
    }
}

#Preview {
    ScaledToFillView()
}
