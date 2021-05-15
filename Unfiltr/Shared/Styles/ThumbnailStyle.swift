//
//  ThumbnailStyle.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import Foundation
import SwiftUI

struct ThumbnailStyle : ViewStyle {
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
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .foregroundColor(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        case .medium:
            return content
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
                .foregroundColor(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        case .large:
            return content
                .aspectRatio(contentMode: .fit)
                .frame(width: 82, height: 82)
                .foregroundColor(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }

    }

}

