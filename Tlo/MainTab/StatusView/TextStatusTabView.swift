//
//  CurrentStatusView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct TextStatusTabView: View {
  @Environment(CalendarViewModel.self) var calendarVM
  @Binding var currentDay: Int
  private var depth: Int {
    calendarVM.depth
  }
  private var daysRange: ClosedRange<Int> {
    let daysInWeek = 7
    let weekDay = calendarVM.getWeekDayUniversal(from: calendarVM.initDay)
    
    let daysAfter = daysInWeek - weekDay
    let daysBefore = daysInWeek - daysAfter - 1
    
    return (-daysInWeek*depth - daysBefore)...(depth*daysInWeek + daysAfter)
  }
  
  var body: some View {
    TabView(selection: $currentDay) {
      ForEach(daysRange, id:\.self) { offset in
        TextStatusView(status: (calendarVM.getDay(offset: offset)))
          .tag(offset)
      }
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
}

#Preview {
  ContentView()
}
