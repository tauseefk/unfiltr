//
//  Conversation+View.swift
//  Unfiltr
//
//  Created by Tauseef Khan on 5/15/21.
//

import Foundation
import Compose
import SwiftUI

extension ConversationComponent: View {
  var body: some View {
    VStack {
      ConversationView(conversation: dummyConversation)
    }
    .viewStyle(AppViewStyle())
    .composeNavigationBar(title: "Unfiltered", backButtonEmitter: goBack)
    .composeNavigationBarStyle(.init(backgroundColor: AppColor.background, foregroundColor: AppColor.text, tintColor: AppColor.text))
    .transition(.move(edge: .trailing))
  }
}
