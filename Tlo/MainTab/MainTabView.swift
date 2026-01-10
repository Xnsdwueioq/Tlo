//
//  ContentView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 21.12.2025.
//

import SwiftUI

struct MainTabView: View {
  @State private var headerOpacity: Double = 0
  
  var body: some View {
    ScrollView {
      ZStack {
        ShapesView()
          .frame(height: 700)
        
        VStack(spacing: 0) {
          GeometryReader { proxy in
            let offset = proxy.frame(in: .scrollView).minY
            Color.clear
              .onChange(of: offset) { oldValue, newValue in
                let progress = -newValue / 30 // дистанция проявления
                headerOpacity = max(0, min(1, progress))
              }
            // Text("\(offset)")
          }
          .frame(height: 0)
          
          WeekView()
          CurrentStatusView()
          MarkButtonView()
          MyStatView()
          Spacer()
        }
      }
    }
    .safeAreaInset(edge: .top) {
      HeaderView()
        .background(
          .ultraThinMaterial
            .opacity(headerOpacity)
        )
    }
    .background(.mainBackground)
  }
}

#Preview {
  MainTabView()
}
