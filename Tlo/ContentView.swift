//
//  ContentView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 21.12.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var calendarVM = CalendarViewModel()
  var body: some View {
    MainTabView()
      .environment(calendarVM)
  }
}

#Preview {
  ContentView()
}
