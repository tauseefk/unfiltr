//
//  UserService.swift
//  Unfiltr
//
//  Created by Md Tauseef on 4/22/21.
//

import Foundation
import Compose

extension Services {
  var user: UserService {
    get {
      self[UserService.self]
    }
    set {
      self[UserService.self] = newValue
    }
  }
}

struct UserService: Service {
  static var Name: String = "unfiltr.user"
  
  let account = PlainStore<Account>()
}
