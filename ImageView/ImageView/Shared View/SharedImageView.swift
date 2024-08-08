//
//  SharedImageView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct SharedImageView<ImageView: View>: View {
    
    private let modifier: Modifier
    private let images: [ImageResource] = [.image0, .image1]
    @State private var currentImage: ImageResource = .image0
    
    var imageView: (ImageResource) -> ImageView
    
    init(modifier: Modifier, imageView: @escaping (ImageResource) -> ImageView) {
        self.modifier = modifier
        self.imageView = imageView
    }
    
    var body: some View {
        Text(modifier.title)
            .padding()
        
        Picker("Images", selection: $currentImage) {
            ForEach(images) { image in
                Text("\(image.name)")
            }
        }
        .pickerStyle(.segmented)
        .padding([.top, .bottom], 0)
        .padding([.leading, .trailing], 16)
        .zIndex(99)
               
        Spacer()
        
        imageView(currentImage)
        
        Spacer()
    }
}
