//
//  ShadowView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ShadowView: View {
    
    @State private var radius: Double = 5.0
    @State private var x: Double = 0
    @State private var y: Double = 0
    
    private let images: [ImageResource] = [.image0, .image1]
    @State private var currentImage: ImageResource = .image0
    
    var body: some View {
        VStack {
            
            Text(Modifier.shadow.title)
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
                    .shadow(radius: radius, x: x, y: y)
            }
            .frame(width: 300, height: 300)
            .padding()
            
            Spacer()
            
            InfoView(title: "Radius :  \(String(format: "%.1f", radius))") {
                Slider(value: $radius, in: 0...100)
            }
            InfoView(title: "X :  \(String(format: "%.1f", x))") {
                Slider(value: $x, in: 0...100)
            }
            InfoView(title: "Y :  \(String(format: "%.1f", y))") {
                Slider(value: $y, in: 0...100)
            }
        }
    }
}

#Preview {
    ShadowView()
}
