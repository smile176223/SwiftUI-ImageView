//
//  UnitPoint+Extension.swift
//  ImageView
//
//  Created by Liam on 2024/8/9.
//

import SwiftUI

extension UnitPoint: CaseIterable, Identifiable {
    public static var allCases: [UnitPoint] = [
        .topLeading,
        .top,
        .topTrailing,
        .leading,
        .center,
        .trailing,
        .bottomLeading,
        .bottom,
        .bottomTrailing
    ]
    
    public var id: Self { self }
    
    public var name: String {
        switch self {
        case .topLeading:
            return "topLeading"
        case .top:
            return "top"
        case .topTrailing:
            return "topTrailing"
        case .leading:
            return "leading"
        case .center:
            return "center"
        case .trailing:
            return "trailing"
        case .bottomLeading:
            return "bottomLeading"
        case .bottom:
            return "bottom"
        case .bottomTrailing:
            return "bottomTrailing"
        default:
            return "unknown"
        }
    }
}
