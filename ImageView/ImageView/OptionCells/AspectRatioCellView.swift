//
//  AspectRatioCellView.swift
//  ImageView
//
//  Created by Liam on 2024/8/6.
//

import SwiftUI

struct AspectRatioCellView: View {
    @Binding var isAspectRatio: Bool
    @Binding var contentMode: ContentMode
    @Binding var aspectRatio: CGFloat?
    
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
            
            if isAspectRatio {
                
                InfoView(title: "Content Mode : ") {
                    Picker("Content Mode", selection: $contentMode) {
                        ForEach(ContentMode.allCases) { mode in
                            Text("\(mode)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                .setBorder(isAspectRatio)
        )
    }
}

#Preview {
    struct AspectRatioCellViewPreview: View {
        @State private var isAspectRatio: Bool = true
        @State private var contentMode: ContentMode = .fit
        @State private var aspectRatio: CGFloat? = nil
        
        var body: some View {
            AspectRatioCellView(
                isAspectRatio: $isAspectRatio,
                contentMode: $contentMode,
                aspectRatio: $aspectRatio
            )
            .padding()
        }
    }
    
    return AspectRatioCellViewPreview()
}
