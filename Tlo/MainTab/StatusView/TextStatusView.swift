//
//  TextStatusView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 14.01.2026.
//

import SwiftUI

struct TextStatusView: View {
  var body: some View {
    VStack(spacing: 5) {
      Text("Какать:")
        .bold()
      Text("N-й день")
        .font(.system(size: 48, weight: .bold))
    }
  }
}

#Preview {
  StatusView()
    .environment(CalendarViewModel())
    .background(.gray.opacity(0.3))
}
