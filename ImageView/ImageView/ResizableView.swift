//
//  ResizableView.swift
//  ImageView
//
//  Created by Liam on 2024/8/5.
//

import SwiftUI

struct ResizableView: View {
    @Binding var isResizable: Bool
    @Binding var top: CGFloat
    @Binding var bottom: CGFloat
    @Binding var leading: CGFloat
    @Binding var trailing: CGFloat
    @Binding var resizingMode: Image.ResizingMode
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                InfoView(title: "Resizable :") {
                    Button {
                        isResizable.toggle()
                    } label: {
                        Text("\(isResizable)")
                            .foregroundStyle(Color.blue)
                    }
                }
                
                if isResizable {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("CapInset")
                        Spacer()
                    }
                    
                    InfoView(title: "top : ") {
                        Slider(value: $top, in: 0...100)
                    }
                    InfoView(title: "bottom : ") {
                        Slider(value: $bottom, in: 0...100)
                    }
                    InfoView(title: "leading : ") {
                        Slider(value: $leading, in: 0...100)
                    }
                    InfoView(title: "trailing : ") {
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
            .frame(width: geometry.size.width - 32, alignment: .center)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
            )
        }
    }
}
