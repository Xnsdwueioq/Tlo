//
//  SettingsSheetView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct SettingsModalView: View {
  @State private var headerOpacity: Double = 0
  
  var body: some View {
    ScrollView {
      HeaderTrackerView(headerOpacity: $headerOpacity)
      VStack(spacing: 15) {
        ProposalPremiumView()
        ProfileCardView()
      }
      .padding(.horizontal, 15)
      UserGoalView()
    }
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

#Preview {
  SettingsModalView()
}
