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
    .buttonStyle(DayStyle(hasEntry: hasEntry))
    .background(
      isSelected
      ? Circle()
        .foregroundStyle(calendarVM.isPoopDay ? Color.white : Color.nopoopSelectedDay)
      : nil
    )
    .animation(.easeInOut(duration: 0.5), value: isSelected)
  }
}
