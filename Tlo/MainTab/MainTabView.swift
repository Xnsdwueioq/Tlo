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
  
  var body: some View {
    ScrollView {
      ZStack {
        ShapesView()
        VStack(spacing: 0) {
          HeaderTrackerView(headerOpacity: $headerOpacity)
          WeekView()
          StatusView()
            .padding(.vertical, 70)
          Spacer()
        }
      }
    }
    .safeAreaInset(edge: .top) {
      MainTabHeaderView(selectedDay: calendarVM.selectedDay)
        .padding(.bottom, 5)
        .background(
          .ultraThinMaterial
            .opacity(headerOpacity)
        )
    }
    .background(calendarVM.selectedDayIsPoop ? .mainPoopBackground : .mainNopoopBackground)
  }
}

#Preview {
  ContentView()
}
