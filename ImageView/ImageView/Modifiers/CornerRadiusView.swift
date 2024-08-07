//
//  CornerRadiusView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct CornerRadiusView: View {
    
    @State private var cornerRadius: CGFloat = 25
    
    private let images: [ImageResource] = [.image0, .image1]
    @State private var currentImage: ImageResource = .image0
    
    var body: some View {
        VStack {
            
            Text(Modifier.cornerRadius.title)
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
                    .cornerRadius(cornerRadius)
            }
            .frame(width: 300, height: 300)
            .border(.orange, width: 3)
            .padding()
            
            Spacer()
            
            InfoView(title: "CornerRadius :  \(Int(cornerRadius))") {
                Slider(value: $cornerRadius, in: 0...150)
            }
        }
    }
}

#Preview {
    CornerRadiusView()
}
