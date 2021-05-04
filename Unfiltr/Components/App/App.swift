//
//  App.swift
//  Unfiltr
//
//  Created by Md Tauseef on 4/22/21.
//

import Foundation
import Compose
import SwiftUI

@main
struct AppComponent: RouterComponent {
  
  let conversations = ConversationsComponent()
  let settings = DynamicComponent<SettingsComponent>()
  
  @ObservedObject var router = Router(start: \Self.self)

  let openSettings = SignalEmitter()
}
