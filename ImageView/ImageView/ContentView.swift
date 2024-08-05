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
    @State var top: CGFloat = 20
    @State var bottom: CGFloat = 20
    @State var leading: CGFloat = 20
    @State var trailing: CGFloat = 20
    @State private var resizingMode: Image.ResizingMode = .stretch
    
    var body: some View {
        ZStack {
            Image(.image0)
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
                .padding()
        }
        
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
                    .presentationDetents([.fraction(0.1), .medium, .large])
                    .presentationDragIndicator(.visible)
                    .presentationBackgroundInteraction(.enabled)
                    .interactiveDismissDisabled()
            }
    }
}

#Preview {
    ContentView()
}
