//
//  SettingsDestinationHeaderView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

struct SettingsDestinationHeaderView: View {
  @Environment(NavigationRouter.self) private var router
  let title: String
  var opacity: Double = 0
  
  var body: some View {
    ZStack {
      Text(title)
        .font(.title3)
        .bold()
      HStack {
        Button(action: { router.settingsRouter.removeLast() }) {
          Image(systemName: "chevron.left")
            .font(.title)
            .foregroundStyle(.black)
        }
        Spacer()
      }
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 10)
    .background(
      .ultraThinMaterial
        .opacity(opacity)
    )
  }
}

#Preview {
  SettingsDestinationHeaderView(title: "Title")
    .environment(NavigationRouter())
}
