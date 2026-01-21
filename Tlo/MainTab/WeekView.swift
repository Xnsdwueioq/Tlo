//
//  WeekView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct WeekView: View {
  @Environment(CalendarViewModel.self) private var calendarVM
  private var depth: Int {
    return calendarVM.depth
  }
  private var initWeekDayIndex: Int {
    calendarVM.getWeekDayUniversal(from: calendarVM.initDay)
  }
  private var isSelectedDayOnInitWeek: Bool {
    let initWeek = calendarVM.startOfInitWeek
    let selectedWeek = calendarVM.startOfSelectedDayWeek
    return initWeek == selectedWeek
  }
  let days = ["П", "В", "С", "Ч","П","С","В"]
  
  var body: some View {
    VStack (spacing: 5) {
      // days of week
      HStack (spacing: -1) {
        ForEach(0..<7, id:\.self) { dayIndex in
          let isToday: Bool = (dayIndex+1) == initWeekDayIndex && isSelectedDayOnInitWeek
          Text(isToday ? "СЕГОДНЯ" : days[dayIndex])
            .foregroundStyle(isToday ? .black : .gray)
            .frame(width: 55)
            .bold()
            .animation(.none, value: isToday)
        }
      }
      .font(.caption2)
      
      // tabview
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
          .tag(offset)
        }
      }
      .tabViewStyle(.page(indexDisplayMode: .never))
      .frame(height: 50)
    }
  }
}

#Preview {
  @Previewable @State var calendarVM = CalendarViewModel()
  MainTabView()
    .environment(calendarVM)
//    .onAppear(perform: {
//      calendarVM.initDay = calendarVM.initDay.advanced(by: 3600*24*(2))
//    })
}
