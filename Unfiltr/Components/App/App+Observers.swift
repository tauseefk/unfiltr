//
//  App+Observer.swift
//  Unfiltr
//
//  Created by Md Tauseef on 4/22/21.
//

import Foundation
import Compose
import SwiftUI

extension AppComponent {
  
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
