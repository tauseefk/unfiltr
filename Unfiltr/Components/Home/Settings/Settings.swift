//
//  Conversations.swift
//  Unfiltr
//
//  Created by Md Tauseef on 4/22/21.
//

import Foundation
import Compose
import SwiftUI

struct SettingsComponent: Component {
  @ObservedObject var account = MappedStore(for: \Self.services.user.account)
  let goBack = SignalEmitter()
}
