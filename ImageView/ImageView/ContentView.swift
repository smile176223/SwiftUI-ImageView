//
//  ContentView.swift
//  ImageView
//
//  Created by Liam on 2024/8/5.
//

import SwiftUI

// # resizable
// # scaleEffect
// # aspectRatio
// # clipShape

struct ContentView: View {
    @State private var isSheetPresented = true
    @State private var isResizable = true
    @State private var cornerRadius: Double = 25
    @State private var contentMode: ContentMode = .fit
    @State var top: CGFloat = 0
    @State var bottom: CGFloat = 0
    @State var leading: CGFloat = 0
    @State var trailing: CGFloat = 0
    @State private var resizingMode: Image.ResizingMode = .stretch
    
    var body: some View {
        ZStack {
            Image(.image0)
                .setResizable(
                    isResizable,
                    capInsets: EdgeInsets(
                        top: top,
                        leading: leading,
                        bottom: bottom,
                        trailing: trailing
                    ),
                    resizingMode: resizingMode
                )
                .aspectRatio(contentMode: contentMode)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .padding()
        }
        
        Spacer()
            .frame(height: UIScreen.main.bounds.height * 0.1)
            .sheet(isPresented: $isSheetPresented) {
                ControlView(
                    isResizable: $isResizable,
                    cornerRadius: $cornerRadius,
                    contentMode: $contentMode,
                    top: $top,
                    bottom: $bottom,
                    leading: $leading,
                    trailing: $trailing,
                    resizingMode: $resizingMode
                )
                    .presentationDetents([.fraction(0.1), .medium, .large])
                    .presentationDragIndicator(.visible)
                    .presentationBackgroundInteraction(.enabled)
                    .interactiveDismissDisabled()
            }
    }
}

#Preview {
    ContentView()
}

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

struct ControlView: View {
    @Binding var isResizable: Bool
    @Binding var cornerRadius: Double
    @Binding var contentMode: ContentMode
    @Binding var top: CGFloat
    @Binding var bottom: CGFloat
    @Binding var leading: CGFloat
    @Binding var trailing: CGFloat
    @Binding var resizingMode: Image.ResizingMode
    
    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading) {
//                
//                InfoView(title: "Resizable :") {
//                    Button {
//                        isResizable.toggle()
//                    } label: {
//                        Text("\(isResizable)")
//                    }
//                }
//                
//                if isResizable {
//                    
//                    HStack(alignment: .center) {
//                        Spacer()
//                        Text("CapInset")
//                        Spacer()
//                    }
//                    
//                    InfoView(title: "top : ") {
//                        Slider(value: $cornerRadius, in: 0...100)
//                    }
//                    InfoView(title: "bottom : ") {
//                        Slider(value: $cornerRadius, in: 0...100)
//                    }
//                    InfoView(title: "leading : ") {
//                        Slider(value: $cornerRadius, in: 0...100)
//                    }
//                    InfoView(title: "trailing : ") {
//                        Slider(value: $cornerRadius, in: 0...100)
//                    }
//                    
//                    InfoView(title: "Resizing Mode : ") {
//                        Picker("Resizing Mode", selection: $resizingMode) {
//                            ForEach(Image.ResizingMode.allCases) { mode in
//                                Text("\(mode)")
//                            }
//                        }
//                        .pickerStyle(.segmented)
//                    }
//                }
//                
//                InfoView(title: "CornerRadius : \(Int(cornerRadius))") {
//                    Slider(value: $cornerRadius, in: 0...100)
//                }
//                
//                InfoView(title: "Content Mode : ") {
//                    Picker("content mode", selection: $contentMode) {
//                        ForEach(ContentMode.allCases) { mode in
//                            Text("\(mode)")
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                }
//            }
//        }
//        .padding(.top, 20)
        List {
            ResizableView(
                isResizable: $isResizable,
                top: $top,
                bottom: $bottom,
                leading: $leading,
                trailing: $trailing,
                resizingMode: $resizingMode
            )
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        .padding(.top, 20)
    }
}

extension ContentMode: Identifiable {
    public var id: Self { self }
}

extension Image.ResizingMode: CaseIterable, Identifiable {
    public static var allCases: [Image.ResizingMode] = [.stretch, .tile]
    
    public var id: Self { self }
}

extension Image {
    func setResizable(_ isSet: Bool = true, capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode) -> Image {
        if isSet {
            return self
                .resizable(resizingMode: resizingMode)
        } else {
            return self
        }
    }
}
