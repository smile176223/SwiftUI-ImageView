//
//  ImageResource+Extension.swift
//  ImageView
//
//  Created by Liam on 2024/8/6.
//

import SwiftUI

extension ImageResource: Identifiable {
    public var id: Self { self }
    
    var name: String {
        switch self {
        case .image0:
            return "Image"
        case .image1:
            return "Icon"
        default:
            return "Unknown"
        }
    }
}

