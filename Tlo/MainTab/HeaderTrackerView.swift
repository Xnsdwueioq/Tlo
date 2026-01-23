//
//  HeaderTrackerView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 13.01.2026.
//

import SwiftUI

struct HeaderTrackerView: View {
  @Binding var headerOpacity: Double
  private let manifestationDistance: CGFloat = 30
  
  var body: some View {
    GeometryReader { geometry in
      let offset = geometry.frame(in: .scrollView).minY
      Color.clear
        .onChange(of: offset) { _, newValue in
          let progress = -newValue / manifestationDistance
          headerOpacity = max(0, min(1, progress))
        }
    }
    .frame(height: 0)
  }
}
