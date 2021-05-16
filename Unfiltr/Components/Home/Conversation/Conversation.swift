//
//  Conversation.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import Foundation
import Compose

struct ConversationComponent: Component {
  
  @RouterObject(\AppComponent.self) var router

  // Navigation
  let goBack = SignalEmitter()
}
