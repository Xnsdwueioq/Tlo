//
//  ButtonStyles.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct DayStyle: ButtonStyle {
  private var isPoop: Bool
  private var isExpected: Bool
  private var foregroundColor: Color = .clear
  
  @ViewBuilder
  private var backgroundShape: some View {
    if isPoop {
      Circle()
        .fill(Color.accent)
    } else if isExpected {
      Circle()
        .stroke(
          .accent,
          style: StrokeStyle(
            lineWidth: 2,
            lineCap: .round,
            dash: [0, 4],
            dashPhase: 6
          )
        )
    } else {
      Circle()
        .fill(.clear)
    }
  }
  
  init(hasEntry: Bool, isExpected: Bool = false) {
    self.isPoop = hasEntry
    self.isExpected = hasEntry ? false : isExpected
    
    self.foregroundColor =
      if hasEntry { .white }
      else if isExpected { .accent }
      else { .black }
      
  }
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(width: 50, height: 50)
      .foregroundStyle(
        foregroundColor
      )
      .background(
        backgroundShape
          .frame(width: 33, height: 33)
      )
  }
}
