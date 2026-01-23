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
  
  var body: some View {
    TabView(selection: $currentDay) {
      ForEach(calendarVM.daysDepth, id:\.self) { offset in
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
