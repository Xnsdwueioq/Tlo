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
      ProfileCardView()
        .padding(.horizontal, 15)
        .shadow(radius: 2, y: 2)
      List {
        NavigationLink("Отчет для врача", destination: {
          Text("Отчет для врача")
        })
      }
      
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
