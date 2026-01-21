//
//  DayView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 13.01.2026.
//
import SwiftUI

struct DayView: View {
  @Environment(CalendarViewModel.self) var calendarVM
  var date: Date = Date()
  var isSelected: Bool {
    return date.startOfDay == calendarVM.selectedDay.startOfDay
  }
  var hasEntry: Bool {
    return calendarVM.hasEntry(on: date)
  }
  
  var body: some View {
    Button("\(date.formatted(.dateTime.day()))") {
      withAnimation {
        calendarVM.selectedDay = date.startOfDay
      }
    }
    .fontWeight(isSelected && hasEntry ? .bold : .regular)
    .buttonStyle(DayStyle(hasEntry: hasEntry))
    .animation(.easeInOut, value: hasEntry)
  }
}
