//
//  AppStyle.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import Foundation
import SwiftUI

struct AppViewStyle : ViewStyle {
    
    enum Background {
        case `default`
        case dimmed
        
        var color : Color {
            switch self {
            
            case .default:
                return AppColor.background
                
            case .dimmed:
                return AppColor.backgroundDim
            
            }
        }
    }
    
    let background : Background
    
    init(background : Background = .default) {
        self.background = background
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .background(background.color)
    }
    
}

struct AppContentViewStyle : ViewStyle {

    func body(content: Content) -> some View {
        content
            .padding(.top, 16)
    }
    
}

