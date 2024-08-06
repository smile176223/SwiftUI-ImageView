//
//  View+Extension.swift
//  ImageView
//
//  Created by Hao on 2024/8/6.
//

import SwiftUI

extension View {
    func setBorder(_ isSet: Bool = true) -> AnyView {
        if isSet {
            return AnyView(
                self.border(.green, width: 2)
            )
        } else {
            return AnyView(self)
        }
    }
}
