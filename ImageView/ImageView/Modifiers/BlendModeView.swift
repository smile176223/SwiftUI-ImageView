//
//  BlendModeView.swift
//  ImageView
//
//  Created by Liam on 2024/8/8.
//

import SwiftUI

struct BlendModeView: View {
    
    @State private var blendModel: BlendMode = .color
    
    var body: some View {
        
        VStack {
            SharedImageView(modifier: .blendMode) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                    
                    Color.red
                        .frame(width: 200, height: 200, alignment: .center)
                        .rotationEffect(.degrees(45))
                        .blendMode(blendModel)
                    
                }
            }
            
            Menu {
                Picker("blendModel", selection: $blendModel) {
                    ForEach(BlendMode.allCases) { blendModel in
                        Text("\(blendModel)")
                    }
                }
            } label: {
                Text("\(blendModel.id)")
                    .font(.title)
                    .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    BlendModeView()
}
