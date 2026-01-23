//
//  WeekView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct WeekView: View {
  var body: some View {
    VStack (spacing: 5) {
      LiteralWeekDaysView()
      // Tab
      ZStack {
        SelectDaysView()
        WeekTabView()
      }
      .frame(height: 50)
    }
  }
}

#Preview {
  @Previewable @State var calendarVM = CalendarViewModel()
  WeekView()
    .environment(calendarVM)
    .background(Color.yellow)
//    .onAppear(perform: {
//      calendarVM.initDay = calendarVM.initDay.advanced(by: 3600*24*(2))
//    })
}
