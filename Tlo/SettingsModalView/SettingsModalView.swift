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
        ScrollView(.horizontal, content: {
          Button("Следить за стулом") {
          }
          
        })
      }
      .padding(.horizontal, 15)
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
