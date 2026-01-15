//
//  HeaderTrackerView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 13.01.2026.
//
import SwiftUI

struct HeaderTrackerView: View {
  @Binding var headerOpacity: Double
  
  var body: some View {
    GeometryReader { proxy in
      let offset = proxy.frame(in: .scrollView).minY
      Color.clear
        .onChange(of: offset) { oldValue, newValue in
          let progress = -newValue / 30 // дистанция проявления
          headerOpacity = max(0, min(1, progress))
        }
      // Text("\(offset)")
    }
  }
}
