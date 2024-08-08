//
//  Modifier.swift
//  ImageView
//
//  Created by Liam on 2024/8/7.
//

import SwiftUI

public enum Modifier: Hashable {
    case resizable
    case scaledToFit
    case scaledToFill
    case aspectRatio
    case frame
    case clipShape
    case cornerRadius
    case opacity
    case shadow
    case overlay
    case border
    case background
    case blendMode
    case brightness
    case contrast
    case saturation
    case hueRotation
    case grayscale
    case blur
    case rotationEffect
    
    public var title: String {
        switch self {
        case .resizable:
            return "resizable(capInsets:resizingMode:)"
        case .scaledToFit:
            return "scaledToFit()"
        case .scaledToFill:
            return "scaledToFill()"
        case .aspectRatio:
            return "aspectRatio(_:contentMode:)"
        case .frame:
            return "frame(width:height:alignment:)"
        case .clipShape:
            return "clipShape(_:)"
        case .cornerRadius:
            return "cornerRadius(_:)"
        case .opacity:
            return "opacity(_:)"
        case .shadow:
            return "shadow(color:radius:x:y:)"
        case .overlay:
            return "overlay(_:alignment:)"
        case .border:
            return "border(_:width:)"
        case .background:
            return "background(alignment:content:)"
        case .blendMode:
            return "blendMode(_:)"
        case .brightness:
            return "brightness(_:)"
        case .contrast:
            return "contrast(_:)"
        case .saturation:
            return "saturation(_:)"
        case .hueRotation:
            return "hueRotation(_:)"
        case .grayscale:
            return "grayscale(_:)"
        case .blur:
            return "blur(radius:opaque:)"
        case .rotationEffect:
            return "rotationEffect(_:anchor:)"
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .resizable:
            ResizableView()
        case .scaledToFit:
            ScaledToFitView()
        case .scaledToFill:
            ScaledToFillView()
        case .aspectRatio:
            AspectRatioView()
        case .frame:
            FrameView()
        case .clipShape:
            ClipShapeView()
        case .cornerRadius:
            CornerRadiusView()
        case .opacity:
            OpacityView()
        case .shadow:
            ShadowView()
        case .overlay:
            OverlayView()
        case .border:
            BorderView()
        case .background:
            BackgroundView()
        case .blendMode:
            BlendModeView()
        case .brightness:
            BrightnessView()
        case .contrast:
            ContrastView()
        case .saturation:
            SaturationView()
        default:
            Text("Need to implement...")
        }
    }
}
