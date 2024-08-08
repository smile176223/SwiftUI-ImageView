//
//  ScaledToFitView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ScaledToFitView: View {
    
    var body: some View {
        VStack {
            SharedImageView(modifier: .scaledToFit) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 300, height: 300)
                .border(.orange, width: 3)
                .padding()
            }
        }
    }
}

#Preview {
    ScaledToFitView()
}

