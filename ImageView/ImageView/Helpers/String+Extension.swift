//
//  String+Extension.swift
//  ImageView
//
//  Created by Liam on 2024/8/9.
//

import Foundation

extension CGFloat {
    public func oneDecimalString() -> String {
        String(format: "%.1f", self)
    }
}
