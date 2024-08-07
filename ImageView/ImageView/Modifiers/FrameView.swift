//
//  FrameView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct FrameView: View {
    
    @State private var height: CGFloat = 300
    @State private var width: CGFloat = 300
    
    private let images: [ImageResource] = [.image0, .image1]
    @State private var currentImage: ImageResource = .image0
    
    var body: some View {
        VStack {
            
            Text(Modifier.frame.title)
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
            
            ZStack {
                Image(currentImage)
                    .resizable()
                    .frame(width: width, height: height)
            }
            .frame(width: 300, height: 300)
            .border(.orange, width: 3)
            .padding()
            
            Spacer()
            
            InfoView(title: "width :  \(String(format: "%.1f", width))") {
                Slider(value: $width, in: 0...600)
            }
            InfoView(title: "height :  \(String(format: "%.1f", height))") {
                Slider(value: $height, in: 0...600)
            }
        }
    }
}

#Preview {
    FrameView()
}
