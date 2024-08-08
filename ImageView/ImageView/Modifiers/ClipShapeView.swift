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
    
    @State private var currentShape: ShapeCase = .circle
    
    var body: some View {
        VStack {
            
            SharedImageView(modifier: .clipShape) { image in
                ZStack {
                    switch currentShape {
                    case .circle:
                        Image(image)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                    case .rectangle:
                        Image(image)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .clipShape(Rectangle())
                    case .custom:
                        Image(image)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .clipShape(Diamond())
                    }
                }
                .padding()
            }
            
            InfoView(title: "Shape :") {
                Picker("shape", selection: $currentShape) {
                    ForEach(ShapeCase.allCases) { shape in
                        Text("\(shape.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    ClipShapeView()
}
