//
//  BlurView.swift
//  ImageView
//
//  Created by Liam on 2024/8/9.
//

import SwiftUI

struct BlurView: View {
    
    @State private var radius: CGFloat = 0.0
    @State private var opaque: Bool = false
    
    var body: some View {
        VStack {
            SharedImageView(modifier: .blur) { image in
                Image(image)
                    .resizable()
                    .blur(radius: radius, opaque: opaque)
                    .frame(width: 300, height: 300)
            }
            
            HStack {
                Text("Opaque")
                    .bold()
                
                Toggle("", isOn: $opaque)
                    .labelsHidden()
                    
                Spacer()
            }
            .padding()
            
            InfoView(title: "Radius : \(radius.oneDecimalString())") {
                Slider(value: $radius, in: 0...100)
            }
        }
    }
}

#Preview {
    BlurView()
}
