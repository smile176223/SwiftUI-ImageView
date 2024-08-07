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
