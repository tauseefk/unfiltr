//
//  Home+Observers.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import Foundation
import Compose
import SwiftUI

extension HomeComponent {
  
  var observers: Void {
    openSettings += {
        settings.create {
            .init()
        }

        settings.goBack += {
            withAnimation {
                router.pop()
            }

            settings.destroy()
        }

        withAnimation {
            router.push(\Self.settings)
        }
    }
  }
}
