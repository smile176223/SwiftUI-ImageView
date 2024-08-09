//
//  AspectRatioView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct AspectRatioView: View {
    
    @State private var contentMode: ContentMode = .fit
    @State private var ratio: CGFloat? = nil
    @State private var currentRatio: CGFloat = 1.0
    
    @State private var isRatioOn: Bool = false
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .aspectRatio) { image in
                ZStack {
                    Image(image)
                        .resizable()
                        .aspectRatio(
                            ratio,
                            contentMode: contentMode
                        )
                }
                .frame(width: 300, height: 300)
                .border(.orange, width: 3)
                .padding()
            }
            
            Spacer()
                .frame(height: 80)
            
            HStack {
                Text("AspectRatio (CGFloat / CGSize)")
                    .bold()
                
                Toggle("", isOn: $isRatioOn)
                    .onChange(of: isRatioOn) { _, newValue in
                        if newValue {
                            ratio = currentRatio
                        } else {
                            ratio = nil
                        }
                    }
                    .labelsHidden()
                    
                Spacer()
            }
            .padding()
            
            if let _ = ratio {
                HStack {
                    Text(currentRatio.oneDecimalString())
                    
                    Slider(value: $currentRatio, in: 0.0...5.0)
                        .onChange(of: currentRatio) { _, newValue in
                            self.ratio = newValue
                        }
                }
                .padding([.leading, .trailing], 16)
            }
            
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
}

#Preview {
    AspectRatioView()
}
