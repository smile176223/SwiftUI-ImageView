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
    @Binding var top: CGFloat
    @Binding var bottom: CGFloat
    @Binding var leading: CGFloat
    @Binding var trailing: CGFloat
    @Binding var resizingMode: Image.ResizingMode
    
    @Binding var isAspectRatio: Bool
    @Binding var contentMode: ContentMode
    @Binding var aspectRatio: CGFloat?
    
    var body: some View {
        List {
            ResizableView(
                isResizable: $isResizable,
                top: $top,
                bottom: $bottom,
                leading: $leading,
                trailing: $trailing,
                resizingMode: $resizingMode
            )
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            AspectRatioView(
                isAspectRatio: $isAspectRatio,
                contentMode: $contentMode,
                aspectRatio: $aspectRatio
            )
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        .padding(.top, 20)
    }
}

#Preview {
    struct ControlViewPreview: View {
        @State private var isResizable: Bool = true
        @State private var cornerRadius: Double = 25
        @State private var top: CGFloat = 0
        @State private var bottom: CGFloat = 0
        @State private var leading: CGFloat = 0
        @State private var trailing: CGFloat = 0
        @State private var resizingMode: Image.ResizingMode = .stretch
        
        @State private var isAspectRatio: Bool = true
        @State private var contentMode: ContentMode = .fill
        @State private var aspectRatio: CGFloat? = nil
        
        var body: some View {
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
        }
    }
    
    return ControlViewPreview()
}

