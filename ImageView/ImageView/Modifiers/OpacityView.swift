//
//  OpacityView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct OpacityView: View {
    
    @State private var opacity: Double = 0.5
    
    private let images: [ImageResource] = [.image0, .image1]
    @State private var currentImage: ImageResource = .image0
    
    var body: some View {
        VStack {
            
            Text(Modifier.opacity.title)
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
                    .opacity(opacity)
            }
            .frame(width: 300, height: 300)
            .border(.orange, width: 3)
            .padding()
            
            Spacer()
            
            InfoView(title: "opacity :  \(String(format: "%.1f", opacity))") {
                Slider(value: $opacity, in: 0...1)
            }
        }
    }
}

#Preview {
    OpacityView()
}
