//
//  CurrentStatusView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct TextStatusTabView: View {
  @Environment(CalendarViewModel.self) var calendarVM
  var body: some View {
    TabView {
      ForEach(1..<6, content: { _ in
        TextStatusView()
      })
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
}

#Preview {
  StatusView()
    .environment(CalendarViewModel())
    .background(.gray.opacity(0.3))
}
