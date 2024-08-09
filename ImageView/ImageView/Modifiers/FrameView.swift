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
            
            SharedImageView(modifier: .frame) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .frame(width: width, height: height)
                }
                .frame(width: 300, height: 300)
                .border(.orange, width: 3)
                .padding()
            }
            
            InfoView(title: "width :  \(width.oneDecimalString())") {
                Slider(value: $width, in: 0...600)
            }
            InfoView(title: "height :  \(height.oneDecimalString())") {
                Slider(value: $height, in: 0...600)
            }
        }
    }
}

#Preview {
    FrameView()
}
