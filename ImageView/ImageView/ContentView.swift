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
    
    // # resizable
    @State private var isResizable = true
    @State private var cornerRadius: Double = 25
    @State private var top: CGFloat = 0
    @State private var bottom: CGFloat = 0
    @State private var leading: CGFloat = 0
    @State private var trailing: CGFloat = 0
    @State private var resizingMode: Image.ResizingMode = .stretch
    
    // # aspectRatio
    @State private var isAspectRatio = true
    @State private var contentMode: ContentMode = .fit
    @State private var aspectRatio: CGFloat? = nil
    
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
                .frame(height: 10)
            
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
                    .setAspectRatio(
                        isAspectRatio,
                        aspectRatio: aspectRatio,
                        contentMode: contentMode
                    )
                    .frame(width: UIScreen.main.bounds.width - 32, height: 400)
                    .clipped()
            }
            .border(.orange, width: 5)
            
            Spacer()
            
            Spacer()
                .frame(height: UIScreen.main.bounds.height * 0.1)
                .sheet(isPresented: $isSheetPresented) {
                    ControlView(
                        isResizable: $isResizable,
                        cornerRadius: $cornerRadius,
                        top: $top,
                        bottom: $bottom,
                        leading: $leading,
                        trailing: $trailing,
                        resizingMode: $resizingMode,
                        isAspectRatio: $isAspectRatio,
                        contentMode: $contentMode,
                        aspectRatio: $aspectRatio
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
