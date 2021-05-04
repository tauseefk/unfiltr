//
//  UserService+Account.swift
//  Unfiltr
//
//  Created by Md Tauseef on 4/23/21.
//

import Foundation
import Compose

extension UserService {
  struct Account: AnyState {
    var alias: String = "tauseefk"
  }
}

extension UserService {
  func setAlias(alias: String) {
    account.state.alias = alias
  }
  
  func unsetAlias() {
    account.state = .init()
  }
}
