//
//  AppShadowStyle.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import Foundation
import SwiftUI

struct AppShadowStyle : ViewStyle {
    
    enum Size {
        case small
        case medium
        case large
    }
    
    let size: Size
    
    init(size: Size = .medium) {
        self.size = size
    }
    
    func body(content: Content) -> some View {
        switch size {
        case .small:
            return content
                .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0.0, y: 1)
        case .medium:
            return content
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0.0, y: 4)
        case .large:
            return content
                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0.0, y: 10)
        }
        
    }
    
}
