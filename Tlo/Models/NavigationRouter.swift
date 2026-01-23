//
//  NavigationRouter.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

@Observable
class NavigationRouter {
  var showProfile = false
  
  func openProfile() {
    showProfile = true
  }
}
