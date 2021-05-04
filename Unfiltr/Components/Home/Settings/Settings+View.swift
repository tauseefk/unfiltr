//
//  Conversations+View.swift
//  Unfiltr
//
//  Created by Md Tauseef on 4/22/21.
//

import Foundation
import Compose
import SwiftUI

extension SettingsComponent: View {

  var body: some View {
    Text(account.state.alias)
  }
}
