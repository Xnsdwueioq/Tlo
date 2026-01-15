//
//  SwiftUIView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 10.01.2026.
//

import SwiftUI

struct StatusView: View {
  
  
  var body: some View {
    VStack (spacing: 30) {
      TextStatusTabView()
        .frame(height: 80)
      StatusButtonView()
    }
  }
}

#Preview {
  StatusView()
    .environment(CalendarViewModel())
    .background(.gray.opacity(0.3))
}
