//
//  NavigationRouter.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

enum SettingsScreen: Hashable {
  case avatarPicker
}

@Observable
class SettingsRouter {
  var path = NavigationPath()
  
  func push(_ screen: SettingsScreen) {
    path.append(screen)
  }
  
  func removeLast() {
    path.removeLast()
  }
  
  func resetToRoot() {
    path = NavigationPath()
  }
}

@Observable
class NavigationRouter {
  var showProfile = false
  
  var settingsRouter = SettingsRouter()
  
  func openProfile() {
    settingsRouter.resetToRoot()
    showProfile = true
  }
}
