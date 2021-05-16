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
    VStack {
      Text(account.state.alias)
    }
    .frame(minWidth: 0,
           maxWidth: .infinity,
           minHeight: 0,
           maxHeight: .infinity)
    .viewStyle(AppViewStyle())
  }
}
