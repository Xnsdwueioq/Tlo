//
//  SettingsDestinationView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

struct SettingsDestinationView: View {
  let screen: SettingsScreen
  
  var body: some View {
    switch screen {
    case .avatarPicker: AvatarPickerView()
    default: Text("default")
    }
  }
}

#Preview {
  SettingsDestinationView(screen: .avatarPicker)
    .environment(NavigationRouter())
    .environment(UserSession())
}
