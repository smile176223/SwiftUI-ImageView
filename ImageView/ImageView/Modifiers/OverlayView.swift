//
//  OverlayView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct OverlayView: View {
    
    @State private var alignment: Alignment = .center
    
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
                    .overlay(alignment: alignment) {
                        Text("OVERLAY")
                            .bold()
                            .font(.title)
                    }
            }
            .frame(width: 300, height: 300)
            .border(.orange, width: 3)
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    OverlayView()
}
