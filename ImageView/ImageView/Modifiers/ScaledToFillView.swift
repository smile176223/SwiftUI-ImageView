//
//  ScaledToFillView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ScaledToFillView: View {
    
    private let images: [ImageResource] = [.image0, .image1]
    @State private var currentImage: ImageResource = .image0
    
    var body: some View {
        VStack {
            
            Text(Modifier.scaledToFill.title)
                .padding()
            
            Picker("Images", selection: $currentImage) {
                ForEach(images) { image in
                    Text("\(image.name)")
                }
            }
            .pickerStyle(.segmented)
            .padding([.top, .bottom], 0)
            .padding([.leading, .trailing], 16)
            
            Spacer()
                .frame(height: 80)
            
            ZStack {
                Image(currentImage)
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 300, height: 300)
            .border(.orange, width: 3)
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ScaledToFillView()
}
