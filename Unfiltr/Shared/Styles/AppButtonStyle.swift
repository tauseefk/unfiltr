//
//  AppButtonStyle.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import Foundation
import SwiftUI

struct AppButtonStyle : ButtonStyle {
    
    enum Size {
        case full
        case fit
    }
    
    let size: Size
    let color: Color
    
    init(size: Size = .full, color: Color = .accentColor) {
        self.size = size
        self.color = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("ButtonTextColor"))
            .font(Font.system(size: 16, weight: .semibold, design: .default))
            .padding(size == .fit ? 10 : 0)
            .frame(maxWidth: size == .full ? .infinity : nil, maxHeight: size == .full ? 44 : nil)
            .frame(height: size == .full ? 44 : nil)
            .background(color)
            .cornerRadius(4)
            .opacity(configuration.isPressed == true ? 0.65 : 1.0)
    }
    
}

struct AppPillButtonStyle : ButtonStyle {

    enum Size {
        case full
        case fit
    }

    let size: Size
    let color: Color

    init(size: Size = .full, color: Color = .accentColor) {
        self.size = size
        self.color = color
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("ButtonTextColor"))
            .font(Font.system(size: 16, weight: .semibold, design: .default))
            .padding(.vertical, size == .fit ? 12 : 0)
            .padding(.horizontal, size == .fit ? 18 : 0)
            .frame(maxWidth: size == .full ? .infinity : nil, maxHeight: size == .full ? 44 : nil)
            .frame(height: size == .full ? 44 : nil)
            .background(color)
            .cornerRadius(40)
            .opacity(configuration.isPressed == true ? 0.65 : 1.0)
    }

}

struct TransparentDarkButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .font(Font.system(size: 16, weight: .semibold, design: .rounded))
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
            .background(Color.black.opacity(0.2))
            .cornerRadius(4)
            .opacity(configuration.isPressed == true ? 0.65 : 1.0)
            .shadow(radius: 10)
        
    }
}

struct IconButtonStyle : ButtonStyle {
    let tintColor: Color
    let backgroundColor: Color
    let size: CGFloat
    let iconSize: CGFloat
    
    init(tintColor: Color = Color.white, backgroundColor: Color = Color.gray, size: CGFloat = 32, iconSize: CGFloat = 16) {
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.size = size
        self.iconSize = iconSize
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(tintColor)
            .padding((size - iconSize)/2)
            .frame(width: size, height: size, alignment: .center)
            .background(backgroundColor)
            .cornerRadius(size / 2)
            .opacity(configuration.isPressed == true ? 0.65 : 1.0)
    }
}

