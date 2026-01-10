//
//  ButtonStyles.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.footnote)
      .fontWeight(.heavy)
      .padding(8)
      .padding(.horizontal, 10)
      .background(Color.white)
      .clipShape(Capsule())
      .foregroundStyle(configuration.isPressed ? .accent.opacity(0.2) : .accent)
      .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
      .animation(.easeOut(duration: 0.4), value: configuration.isPressed)
  }
}

struct NormalDayStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .bold()
      .frame(width: 33, height: 33)
  }
}

struct ExpectedDayStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundStyle(.accent)
      .bold()
      .frame(width: 33, height: 33)
      .background(
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
      )
  }
}

struct PoopDayStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .bold()
      .foregroundStyle(.white)
      .frame(width: 33, height: 33)
      .background(
        Circle()
          .foregroundStyle(.accent)
      )
  }
}


#Preview {
  MainTabView()
}
