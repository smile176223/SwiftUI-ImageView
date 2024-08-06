//
//  ContentView.swift
//  ImageView
//
//  Created by Liam on 2024/8/5.
//

import SwiftUI

// # resizable
// # scaleEffect
// # aspectRatio
// # clipShape

struct ContentView: View {
    @State private var isSheetPresented = true
    @State private var isResizable = true
    @State private var cornerRadius: Double = 25
    @State private var contentMode: ContentMode = .fit
    @State private var top: CGFloat = 20
    @State private var bottom: CGFloat = 20
    @State private var leading: CGFloat = 20
    @State private var trailing: CGFloat = 20
    @State private var resizingMode: Image.ResizingMode = .stretch
    
    private let imageResources: [ImageResource] = [.image0, .image1]
    @State private var currentImageResource: ImageResource = .image0
    
    var body: some View {
        
        VStack {
            
            Picker("Image", selection: $currentImageResource) {
                ForEach(imageResources) { image in
                    Text("\(image.name)")
                }
            }
            .pickerStyle(.segmented)
            .padding([.all], 10)
            
            Spacer()
            
            ZStack {
                Image(currentImageResource)
                    .setResizable(
                        isResizable,
                        capInsets: EdgeInsets(
                            top: top,
                            leading: leading,
                            bottom: bottom,
                            trailing: trailing
                        ),
                        resizingMode: resizingMode
                    )
                    .aspectRatio(contentMode: contentMode)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }
            .frame(width: 500, height: 500)
            
            Spacer()
            
            Spacer()
                .frame(height: UIScreen.main.bounds.height * 0.1)
                .sheet(isPresented: $isSheetPresented) {
                    ControlView(
                        isResizable: $isResizable,
                        cornerRadius: $cornerRadius,
                        contentMode: $contentMode,
                        top: $top,
                        bottom: $bottom,
                        leading: $leading,
                        trailing: $trailing,
                        resizingMode: $resizingMode
                    )
                    .ignoresSafeArea()
                    .presentationDetents([.fraction(0.1), .medium, .large])
                    .presentationDragIndicator(.visible)
                    .presentationBackgroundInteraction(.enabled)
                    .interactiveDismissDisabled()
                }
        }
    }
}

#Preview {
    ContentView()
}
