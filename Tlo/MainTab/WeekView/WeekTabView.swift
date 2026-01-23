//
//  WeekTabView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 23.01.2026.
//

import SwiftUI

struct WeekTabView: View {
  @Environment(CalendarViewModel.self) private var calendarVM
  private var depth: Int {
    return calendarVM.depth
  }
  
  var body: some View {
    TabView(selection: Binding(get: {
      calendarVM.weekIndex
    }, set: { index in
      withAnimation {
        calendarVM.updateWeekIndex(new: index)
      }
    })) {
      ForEach(-depth...depth, id: \.self) { offset in
        HStack (spacing: 4) {
          ForEach(calendarVM.getWeek(offset: offset), id: \.self) { date in
            DayView(date: date)
          }
        }
      }
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
}

#Preview {
  WeekTabView()
    .environment(CalendarViewModel())
}
