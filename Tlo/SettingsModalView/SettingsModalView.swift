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
      
    }
    .safeAreaInset(edge: .top, content: {
      HeaderView()
        .background(
          .ultraThinMaterial
            .opacity(headerOpacity)
        )
    })
    .padding(.horizontal, 10)
  }
}

#Preview {
  SettingsModalView()
}
