//
//  LiteralWeekDaysView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 23.01.2026.
//

import SwiftUI

struct LiteralWeekDaysView: View {
  @Environment(CalendarViewModel.self) private var calendarVM
  private var depth: Int {
    return calendarVM.depth
  }
  let literalWeekDays = ["П", "В", "С", "Ч", "П", "С", "В"]
  
  var body: some View {
    HStack (spacing: -1) {
      ForEach(0..<7, id:\.self) { dayIndex in
        let isToday: Bool = (dayIndex+1) == calendarVM.initWeekDayIndex && calendarVM.isSelectedDayOnInitWeek
        Text(isToday ? "СЕГОДНЯ" : literalWeekDays[dayIndex])
          .foregroundStyle(isToday ? .black : .gray)
          .frame(width: 55)
          .bold()
          .animation(.none, value: isToday)
      }
    }
    .font(.caption2)
  }
}

#Preview {
  LiteralWeekDaysView()
    .environment(CalendarViewModel())
}
