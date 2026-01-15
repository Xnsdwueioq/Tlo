//
//  DayView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 13.01.2026.
//
import SwiftUI

struct DayView: View {
  var calendarVM: CalendarViewModel
  var date: Date = Date()
  var isSelected: Bool {
    return date.startOfDay == calendarVM.selectedDay.startOfDay
  }
  var hasEntry: Bool {
    return calendarVM.hasEntry(on: date)
  }
  
  var body: some View {
    Button("\(date.formatted(.dateTime.day()))") {
      calendarVM.selectedDay = date.startOfDay
    }
    .buttonStyle(DayStyle(hasEntry: hasEntry))
    .background(
      isSelected
      ? Circle()
        .foregroundStyle(Color.white)
      : nil
    )
    .animation(.easeInOut, value: isSelected)
  }
}

#Preview {
  ContentView()
}
