//
//  CapsuleButtons.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

struct SelectCapsuleButton: View {
  let action: () -> Void
  private let isActive = true

  @Environment(CalendarViewModel.self) private var calendarVM
  private var isPoopDay: Bool {
    calendarVM.selectedDayIsPoop
  }
  private var title: String {
    isPoopDay ? "Изменить даты каканья" : "Отметить каканье"
  }
  
  init(action: @escaping () -> Void) {
    self.action = action
  }
  
  var body: some View {
    Button(action: action) {
      Text(title)
    }
    .buttonStyle(
      CapsuleButtonStyle(isPoopDay: isPoopDay)
    )
  }
}

#Preview {
  SelectCapsuleButton {
  }
  .environment(CalendarViewModel())
}
