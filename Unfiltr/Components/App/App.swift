//
//  App.swift
//  Unfiltr
//
//  Created by Md Tauseef on 4/22/21.
//

import Foundation
import Compose
import SwiftUI

@main
struct AppComponent: RouterComponent {
  
  let home = HomeComponent()
  
  @ObservedObject var router = Router(start: \Self.home)
}
