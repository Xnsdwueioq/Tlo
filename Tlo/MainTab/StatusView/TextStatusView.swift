//
//  TextStatusView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 14.01.2026.
//

import SwiftUI

struct TextStatusView: View {
  @Environment(CalendarViewModel.self) var calendarVM
  var status: (String, Int) = ("", 0)
  
  var body: some View {
    VStack(spacing: 5) {
      Text(status.0)
        .bold()
      Text(status.1 != 0 ? "\(status.1)" : "∞")
        .font(.system(size: 48, weight: .bold))
    }
  }
}
