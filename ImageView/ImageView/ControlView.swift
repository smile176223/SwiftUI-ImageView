//
//  ControlView.swift
//  ImageView
//
//  Created by Liam on 2024/8/6.
//

import SwiftUI

struct ControlView: View {
    @Binding var isResizable: Bool
    @Binding var cornerRadius: Double
    @Binding var contentMode: ContentMode
    @Binding var top: CGFloat
    @Binding var bottom: CGFloat
    @Binding var leading: CGFloat
    @Binding var trailing: CGFloat
    @Binding var resizingMode: Image.ResizingMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                InfoView(title: "Resizable :") {
                    Button {
                        isResizable.toggle()
                    } label: {
                        Text("\(isResizable)")
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
                    
                    Color.gray
                        .frame(height: 2)
                        .padding([.leading, .trailing], 16)
                }
                
                InfoView(title: "CornerRadius : \(Int(cornerRadius))") {
                    Slider(value: $cornerRadius, in: 0...100)
                }
                
                InfoView(title: "Content Mode : ") {
                    Picker("content mode", selection: $contentMode) {
                        ForEach(ContentMode.allCases) { mode in
                            Text("\(mode)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
        .padding(.top, 20)
//        List {
//            ResizableView(
//                isResizable: $isResizable,
//                top: $top,
//                bottom: $bottom,
//                leading: $leading,
//                trailing: $trailing,
//                resizingMode: $resizingMode
//            )
//            .listRowBackground(Color.clear)
//            .listRowSeparator(.hidden)
//        }
//        .listStyle(PlainListStyle())
//        .padding(.top, 20)
    }
}

#Preview {
    ControlView(
        isResizable: .constant(true),
        cornerRadius: .constant(25),
        contentMode: .constant(.fill),
        top: .constant(0),
        bottom: .constant(0),
        leading: .constant(0),
        trailing: .constant(0),
        resizingMode: .constant(.stretch)
    )
}

