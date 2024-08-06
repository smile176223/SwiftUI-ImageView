//
//  AspectRatioView.swift
//  ImageView
//
//  Created by Liam on 2024/8/6.
//

import SwiftUI

struct AspectRatioView: View {
    @Binding var isAspectRatio: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            
            HStack {
                Spacer()
                Text("aspectRatio(_:contentMode:)")
                    .padding()
                    .background {
                        Color.gray
                            .cornerRadius(10)
                    }
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .bold()
                    .onTapGesture {
                        isAspectRatio.toggle()
                    }
                Spacer()
            }
            
            ToggleView(isToggle: $isAspectRatio)
            
            if isAspectRatio {
                
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
        )
    }
}

#Preview {
    struct AspectRatioViewPreview: View {
        @State private var isAspectRatio: Bool = true
        
        var body: some View {
            AspectRatioView(
                isAspectRatio: $isAspectRatio
            )
            .padding()
        }
    }
    
    return AspectRatioViewPreview()
}
