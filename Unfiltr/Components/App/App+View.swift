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
    }
  }
}

struct AppView_Previews: PreviewProvider {
  static let component = AppComponent().bind()
  static var previews: some View {
    component.view
  }
}
