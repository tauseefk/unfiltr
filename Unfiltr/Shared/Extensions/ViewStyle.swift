//
//  ViewStyle.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import SwiftUI

protocol ViewStyle : ViewModifier {
    
}

struct DefaultViewStyle : ViewStyle {
    
    func body(content: Content) -> some View {
        content
    }
    
}

extension View {
    
    func viewStyle<Style : ViewStyle>(_ style : Style) -> some View {
        self.modifier(style)
    }
    
}

