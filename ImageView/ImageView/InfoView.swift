//
//  InfoView.swift
//  ImageView
//
//  Created by Liam on 2024/8/6.
//

import SwiftUI

struct InfoView: View {
    
    var title: String
    var genericView: AnyView
    
    init(title: String, genericView: @escaping () -> some View) {
        self.title = title
        self.genericView = AnyView(genericView())
    }
    
    var body: some View {
        HStack {
            Text(title)
                .bold()
            
            genericView
        }
        .padding([.top, .bottom], 0)
        .padding([.leading, .trailing], 16)
    }
}
