//
//  SelectDaysView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 21.01.2026.
//

import SwiftUI

struct SelectDaysView: View {
  @Environment(CalendarViewModel.self) var calendarVM
  @Namespace private var animationNamespace
  var selectedDayOrder: Int
  let points = Array(1..<8)
  
  var body: some View {
    HStack(spacing: 4) {
      ForEach(points, id: \.self) { index in
        // Selection indicator
        if selectedDayOrder == index {
          Circle()
            .fill(calendarVM.isPoopDay ? Color.white : Color.nopoopSelectedDay)
            .frame(width: 50, height: 50)
            .matchedGeometryEffect(id: "activeCircle", in: animationNamespace)
        } else {
          Color.clear
            .frame(width: 50, height: 50)
        }
      }
    }
    .drawingGroup()
    .animation(.easeInOut(duration: 0.3), value: selectedDayOrder)
  }
}

#Preview {
  SelectDaysView(selectedDayOrder: 0)
    .environment(CalendarViewModel())
}
