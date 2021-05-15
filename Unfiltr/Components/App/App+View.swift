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

extension AppComponent: View {
  
  var body: some View {
    ZStack {
      AppColor.background
        .edgesIgnoringSafeArea(.all)
      
      RouterView()
//      VStack {
//        RouterView()
//          .frame(maxWidth: .infinity, maxHeight: .infinity)
//      }.composeTabBar(router) {
//        ComposeTabBarItem(\Self.conversations) {
//          VStack {
//            Image(systemName: "message")
//              .resizable()
//              .aspectRatio(contentMode: .fit)
//              .frame(width: 18, height: 18)
//            Text("Messages")
//              .font(.system(size: 10))
//              .fontWeight(.semibold)
//              .fixedSize(horizontal: true, vertical: false)
//          }
//        }
//
//        ComposeTabBarItem(\Self.settings) {
//          VStack {
//            Image(systemName: "gearshape")
//              .resizable()
//              .aspectRatio(contentMode: .fit)
//              .frame(width: 18, height: 18)
//            Text("Settings")
//              .font(.system(size: 10))
//              .fontWeight(.semibold)
//              .fixedSize(horizontal: true, vertical: false)
//          }
//        }
//      }
//      .composeTabBarStyle(.init(backgroundColor: AppColor.background, foregroundColor: AppColor.text, tintColor: AppColor.accent, shouldShowDivider: true))
    }
  }
}

struct AppView_Previews: PreviewProvider {
  static let component = AppComponent().bind()
  static var previews: some View {
    component.view
  }
}
