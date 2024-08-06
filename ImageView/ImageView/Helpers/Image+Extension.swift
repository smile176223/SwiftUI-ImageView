//
//  Image+Extension.swift
//  ImageView
//
//  Created by Liam on 2024/8/6.
//

import SwiftUI

extension Image.ResizingMode: CaseIterable, Identifiable {
    public static var allCases: [Image.ResizingMode] = [.stretch, .tile]
    
    public var id: Self { self }
}

extension Image {
    func setResizable(_ isSet: Bool = true, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode) -> Image {
        if isSet {
            return self
                .resizable(resizingMode: resizingMode)
        } else {
            return self
        }
    }
    
    func setAspectRatio(_ isSet: Bool = true, aspectRatio: CGFloat? = nil, contentMode: ContentMode) -> AnyView {
        if isSet {
            return AnyView(self.aspectRatio(aspectRatio, contentMode: contentMode))
        } else {
            return AnyView(self)
        }
    }
}
