//
//  BorderView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct BorderView: View {
    
    @State private var width: CGFloat = 1
    
    private let images: [ImageResource] = [.image0, .image1]
    @State private var currentImage: ImageResource = .image0
    
    var body: some View {
        VStack {
            
            Text(Modifier.border.title)
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
            }
            .frame(width: 300, height: 300)
            .border(.orange, width: width)
            .padding()
            
            Spacer()
            
            InfoView(title: "Border :  \(Int(width))") {
                Slider(value: $width, in: 0...100)
            }
        }
    }
}

#Preview {
    BorderView()
}
