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
  
  var body: some View {
    VStack (spacing: 5) {
      // days of week
      HStack (spacing: 46) {
        Text("П")
        Text("В")
        Text("С")
        Text("Ч")
        Text("П")
        Text("С")
        Text("В")
      }
      .font(.caption2)
      .foregroundStyle(.gray)
      
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
  ContentView()
}
