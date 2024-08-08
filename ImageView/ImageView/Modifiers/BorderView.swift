//
//  BorderView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct BorderView: View {
    
    @State private var width: CGFloat = 1
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .border) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .border(.red, width: width)
                }
                .frame(width: 300, height: 300)
                .padding()
            }
            
            InfoView(title: "Border :  \(Int(width))") {
                Slider(value: $width, in: 0...100)
            }
        }
    }
}

#Preview {
    BorderView()
}
