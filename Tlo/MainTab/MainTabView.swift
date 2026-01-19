//
//  ContentView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 21.12.2025.
//

import SwiftUI

struct MainTabView: View {
  @Environment(CalendarViewModel.self) private var calendarVM
  @State private var headerOpacity: Double = 0
  private let daysInWeek = 7
  
  var body: some View {
    ScrollView {
      ZStack {
        // background shapes
        ShapesView()
          .frame(height: 700)
  
        VStack(spacing: 0) {
          // scrollview offset tracker
          HeaderTrackerView(headerOpacity: $headerOpacity)
            .frame(height: 0)
          WeekView()
          StatusView()
            .padding(.vertical, 70)
          Spacer()
        }
      }
    }
    .safeAreaInset(edge: .top) {
      HeaderView(selectedDay: calendarVM.selectedDay)
        .padding(.bottom, 5)
        .background(
          .ultraThinMaterial
            .opacity(headerOpacity)
        )
    }
    .background(calendarVM.isPoopDay ? .mainPoopBackground : .mainNopoopBackground)
  }
}

#Preview {
  ContentView()
}
