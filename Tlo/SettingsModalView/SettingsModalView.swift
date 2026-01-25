//
//  SettingsSheetView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct SettingsModalView: View {
  @Environment(NavigationRouter.self) private var router
  @State private var headerOpacity: Double = 0
  
  var body: some View {
    @Bindable var router = router
    
    NavigationStack(path: $router.settingsRouter.path) {
      ScrollView {
        HeaderTrackerView(headerOpacity: $headerOpacity)
        VStack(spacing: 15) {
          ProposalPremiumView()
          ProfileCardView()
        }
        .padding(.horizontal, 15)
        UserGoalView()
      }
      .navigationDestination(for: SettingsScreen.self, destination: { screen in
        SettingsDestinationView(screen: screen)
      })
      .background(Color.mainNopoopBackground)
      .safeAreaInset(edge: .top, content: {
        HeaderView()
          .background(
            .ultraThinMaterial
              .opacity(headerOpacity)
          )
      })
    }
  }
}

#Preview {
  SettingsModalView()
    .environment(NavigationRouter())
    .environment(UserSession())
}
