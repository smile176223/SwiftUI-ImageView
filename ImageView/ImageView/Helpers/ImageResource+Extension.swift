//
//  ImageResource+Extension.swift
//  ImageView
//
//  Created by Liam on 2024/8/6.
//

import SwiftUI

extension ImageResource: @retroactive Identifiable {
    public var id: Self { self }
    
    var name: String {
        switch self {
        case .image0:
            return "Big"
        case .image1:
            return "Small"
        default:
            return "Unknown"
        }
    }
}

