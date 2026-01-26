//
//  SettingsDestinationView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

struct SettingsDestinationView: View {
  @Environment(UserSession.self) private var userSession
  let screen: SettingsScreen
  
  var body: some View {
    switch screen {
    case .avatarPicker:
      let avatarPickerVM = AvatarPickerViewModel(userSession: userSession)
      AvatarPickerView(viewModel: avatarPickerVM)
      
    default: Text("default")
    }
  }
}

#Preview {
  SettingsDestinationView(screen: .avatarPicker)
    .environment(NavigationRouter())
    .environment(UserSession())
}
