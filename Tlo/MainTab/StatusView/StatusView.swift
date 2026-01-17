//
//  SwiftUIView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 10.01.2026.
//

import SwiftUI

struct StatusView: View {
  @Environment(CalendarViewModel.self) var calendarVM
  
  var body: some View {
    VStack (spacing: 30) {
      TextStatusTabView(currentDay: Binding(get: {
        calendarVM.dayIndex
      }, set: { index in
        withAnimation {
          calendarVM.updateDayIndex(new: index)
        }
      }))
        .frame(height: 80)
      StatusButtonView()
    }
  }
}
