//
//  AppTextFieldStyle.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import Foundation
import SwiftUI

struct AppTextFieldStyle : TextFieldStyle {
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .border(Color.clear, width: 0)
            .padding(.horizontal, 15)
            .frame(height: 44)
            .background(AppColor.foreground.opacity(0.1))
            .cornerRadius(4)
    }
    
}

