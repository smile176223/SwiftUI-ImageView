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
        VStack(alignment: .leading) {
            HStack {
                InfoView(title: "Resizable :") {
                    Button {
                        isResizable.toggle()
                    } label: {
                        Text("\(isResizable)")
                            .foregroundStyle(Color.blue)
                    }
                }
                Spacer()
            }
            
            if isResizable {
                HStack(alignment: .center) {
                    Spacer()
                    Text("CapInset")
                    Spacer()
                }
                .padding(.top, 10)
                
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
        .frame(width: UIScreen.main.bounds.width - 64)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
        )
    }
    
}

#Preview {
    struct ResizableViewPreview: View {
        @State private var isResizable: Bool = true
        @State private var top: CGFloat = 0
        @State private var bottom: CGFloat = 0
        @State private var leading: CGFloat = 0
        @State private var trailing: CGFloat = 0
        @State private var resizingMode: Image.ResizingMode = .stretch
        
        var body: some View {
            ResizableView(
                isResizable: $isResizable,
                top: $top,
                bottom: $bottom,
                leading: $leading,
                trailing: $trailing,
                resizingMode: $resizingMode
            )
        }
    }
    
    return ResizableViewPreview()
}
