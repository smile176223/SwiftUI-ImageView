//
//  BlendMode+Extension.swift
//  ImageView
//
//  Created by Liam on 2024/8/9.
//

import SwiftUI

extension BlendMode: CaseIterable, Identifiable {
    public static var allCases: [BlendMode] = [
        .color,
        .colorBurn,
        .colorDodge,
        .darken,
        .destinationOut,
        .destinationOver,
        .difference,
        .exclusion,
        .hardLight,
        .hue,
        .lighten,
        .luminosity,
        .multiply,
        .normal,
        .overlay,
        .plusDarker,
        .plusLighter,
        .saturation,
        .screen,
        .softLight,
        .sourceAtop,
    ]
    public var id: Self { self }
}

