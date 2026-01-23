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
  var hasEntry: Bool {
    return calendarVM.hasEntry(on: date)
  }
  
  var body: some View {
    Button("\(date.formatted(.dateTime.day()))") {
      withAnimation {
        calendarVM.selectedDay = date.startOfDay
      }
    }
    .fontWeight(calendarVM.isInitDay(date: date) ? .bold : .regular)
    .buttonStyle(DayStyle(hasEntry: hasEntry))
    .animation(.easeInOut, value: hasEntry)
  }
}
