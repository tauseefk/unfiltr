//
//  Home.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import Foundation
import Compose
import SwiftUI


struct HomeComponent: RouterComponent {
  
  let conversations = ConversationsComponent()
  let settings = DynamicComponent<SettingsComponent>()
  
  @ObservedObject var router = Router(start: \Self.self)

  let openSettings = SignalEmitter()
}
