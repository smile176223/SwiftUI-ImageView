//
//  ResizableView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct ResizableView: View {
    
    @State private var top: CGFloat = 0
    @State private var bottom: CGFloat = 0
    @State private var leading: CGFloat = 0
    @State private var trailing: CGFloat = 0
    @State private var resizingMode: Image.ResizingMode = .stretch
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .resizable) { image in
                ZStack {
                    Image(image)
                        .resizable(
                            capInsets: EdgeInsets(
                                top: top,
                                leading: leading,
                                bottom: bottom,
                                trailing: trailing
                            ),
                            resizingMode: resizingMode
                        )
                }
                .frame(width: 300, height: 300)
                .border(.orange, width: 3)
                .padding()
            }
            
            HStack {
                Text("CapInsets :")
                    .bold()
                Spacer()
            }
            .padding()
            
            InfoView(title: "top : \(Int(top))") {
                Slider(value: $top, in: 0...100)
            }
            InfoView(title: "bottom :  \(Int(bottom))") {
                Slider(value: $bottom, in: 0...100)
            }
            InfoView(title: "leading :  \(Int(leading))") {
                Slider(value: $leading, in: 0...100)
            }
            InfoView(title: "trailing :  \(Int(trailing))") {
                Slider(value: $trailing, in: 0...100)
            }
            InfoView(title: "Resizing Mode : ") {
                Picker("Resizing Mode", selection: $resizingMode) {
                    ForEach(Image.ResizingMode.allCases) { mode in
                        Text("\(mode)")
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    ResizableView()
}

