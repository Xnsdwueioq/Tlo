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
        // background shapes
        ShapesView()
          .frame(height: 700)
        
        VStack(spacing: 0) {
          // scrollview offset tracker
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
          StatusView()
            .padding(.vertical, 85)
          MyStatView()
          
          Spacer()
        }
      }
    }
    .safeAreaInset(edge: .top) {
      HeaderView()
        .padding(.bottom, 5)
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
