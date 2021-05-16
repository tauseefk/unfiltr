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

extension HomeComponent: RoutableView {

  var body: some View {
    RouterView()
  }

  var ConversationsList: some View {
    ScrollView {
      Button(emitter: openConversation, value: "Unfiltered") {
        HStack {
          Text("Unfiltered")
          Spacer()
        }
      }
      .padding(.vertical, 16)
      .padding(.horizontal, 8)
      .frame(minWidth: 0,
             maxWidth: .infinity,
             minHeight: 0,
             maxHeight: 65)
    }
    .viewStyle(AppViewStyle())
  }

  var routableBody: some View {
    VStack {
      ConversationsList
    }
    .composeNavigationBar(title: "Conversations", leftView: {
      Spacer()
    }, rightView: {
      HStack {
        Image(systemName: "gearshape")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 18, height: 18)
          .onTapGesture {
            openSettings.send()
          }
      }
    })
    .composeNavigationBarStyle(.init(backgroundColor: AppColor.background, foregroundColor: AppColor.text, tintColor: AppColor.text))
  }
}

struct HomeView_Previews: PreviewProvider {
  static let component = HomeComponent().bind()
  static var previews: some View {
    component.view
  }
}
