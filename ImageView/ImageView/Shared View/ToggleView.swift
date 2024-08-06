//
//  ToggleView.swift
//  ImageView
//
//  Created by Liam on 2024/8/6.
//

import SwiftUI

struct ToggleView: View {
    @Binding var isToggle: Bool
    
    var body: some View {
        if isToggle {
            Text("✅")
        } else {
            Text("❌")
        }
    }
}
