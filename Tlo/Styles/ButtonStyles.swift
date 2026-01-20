//
//  ButtonStyles.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
  var isPoopDay: Bool
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.footnote)
      .fontWeight(.heavy)
      .padding(8)
      .padding(.horizontal, 10)
      .background(isPoopDay ? Color.white : .accent)
      .clipShape(Capsule())
      .foregroundStyle(configuration.isPressed ? (isPoopDay ? Color.accent : .white).opacity(0.2) : (isPoopDay ? Color.accent : .white).opacity(1))
      .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}

struct DayStyle: ButtonStyle {
  private var hasEntry: Bool
  private var isExpected: Bool
  private var foregroundColor: Color = .clear
  @ViewBuilder private var backgroundShape: some View {
    if hasEntry {
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
    self.hasEntry = hasEntry
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
