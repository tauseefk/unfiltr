//
//  UnfiltrApp.swift
//  Unfiltr
//
//  Created by Md Tauseef on 12/23/20.
//

import SwiftUI

@main
struct UnfiltrApp: App {
    var body: some Scene {
        WindowGroup {
            ConversationView(conversation: dummyConversation)
        }
    }
}
