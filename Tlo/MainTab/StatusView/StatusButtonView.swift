//
//  MarkButtonView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct StatusButtonView: View {
  @Environment(CalendarViewModel.self) var calendarVM
  
  var body: some View {
    Button(action: {
      calendarVM.addEntry()
    }, label: {
      Text("Изменить даты каканья")
    })
    .buttonStyle(CapsuleButtonStyle())
  }
}
