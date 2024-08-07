//
//  ClipShapeView.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path({ path in
            path.addLines([
                CGPoint(x: rect.midX, y: 0),
                CGPoint(x: rect.maxX, y: rect.midY),
                CGPoint(x: rect.midX, y: rect.maxY),
                CGPoint(x: 0, y: rect.midY)
            ])
        })
    }
}

struct ClipShapeView: View {
    
    enum ShapeCase: String, CaseIterable, Identifiable {
        var id: Self { self }
        
        case circle
        case rectangle
        case custom
    }
    
    @State private var height: CGFloat = 300
    @State private var width: CGFloat = 300
    
    private let images: [ImageResource] = [.image0, .image1]
    @State private var currentImage: ImageResource = .image0
    
    @State private var currentShape: ShapeCase = .circle
    
    var body: some View {
        VStack {
            
            Text(Modifier.frame.title)
                .padding()
            
            Picker("Images", selection: $currentImage) {
                ForEach(images) { image in
                    Text("\(image.name)")
                }
            }
            .pickerStyle(.segmented)
            .padding([.top, .bottom], 0)
            .padding([.leading, .trailing], 16)
            
            Spacer()
            
            ZStack {
                switch currentShape {
                case .circle:
                    Image(currentImage)
                        .resizable()
                        .frame(width: width, height: height)
                        .clipShape(Circle())
                case .rectangle:
                    Image(currentImage)
                        .resizable()
                        .frame(width: width, height: height)
                        .clipShape(Rectangle())
                case .custom:
                    Image(currentImage)
                        .resizable()
                        .frame(width: width, height: height)
                        .clipShape(Diamond())
                }
            }
            .padding()
            
            Spacer()
            
            InfoView(title: "Shape :") {
                Picker("shape", selection: $currentShape) {
                    ForEach(ShapeCase.allCases) { shape in
                        Text("\(shape.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            InfoView(title: "width :  \(String(format: "%.1f", width))") {
                Slider(value: $width, in: 0...600)
            }
            InfoView(title: "height :  \(String(format: "%.1f", height))") {
                Slider(value: $height, in: 0...600)
            }
        }
    }
}

#Preview {
    ClipShapeView()
}
