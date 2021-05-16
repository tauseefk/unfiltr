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
  let settings = DynamicComponent<SettingsComponent>()
  let conversation = DynamicComponent<ConversationComponent>()
  
  @ObservedObject var router = Router(start: \Self.self)

  let openSettings = SignalEmitter()
  let openConversation = ValueEmitter<String>()
}
