//
//  App+View.swift
//  Unfiltr
//
//  Created by Md Tauseef on 4/22/21.
//

import Foundation
import Compose
import ComposeUI
import SwiftUI

extension AppComponent: RoutableView {
  
  var body: some View {
    RouterView()
  }

    var routableBody: some View {
        VStack {
            ConversationView(conversation: dummyConversation)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Button(emitter: openSettings) {
                Text("Open Settings")
            }
        }
    }
}
