//
//  AspectRatioView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct AspectRatioView: View {
    
    @State private var contentMode: ContentMode = .fit
    
    private let images: [ImageResource] = [.image0, .image1]
    @State private var currentImage: ImageResource = .image0
    
    var body: some View {
        VStack {
            
            Text(Modifier.aspectRatio.title)
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
                    .aspectRatio(contentMode: contentMode)
            }
            .frame(width: 300, height: 300)
            .border(.orange, width: 3)
            .padding()
            
            Spacer()
            
            InfoView(title: "Content Mode : ") {
                Picker("Content Mode", selection: $contentMode) {
                    ForEach(ContentMode.allCases) { mode in
                        Text("\(mode)")
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    AspectRatioView()
}
