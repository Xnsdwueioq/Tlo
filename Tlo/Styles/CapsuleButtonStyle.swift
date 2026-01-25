//
//  ButtonStyles.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
  var isPoopDay: Bool
  var isBold: Bool
  var isActive: Bool
  
  init() {
    self.isPoopDay = false
    self.isBold = false
    self.isActive = true
  }
  init(isPoopDay: Bool) {
    self.isPoopDay = isPoopDay
    self.isBold = true
    self.isActive = true
  }
  init(isActive: Bool) {
    self.isPoopDay = false
    self.isBold = !isActive
    self.isActive = isActive
  }

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.footnote)
      .fontWeight(isBold ? .heavy : .semibold)
      .padding(8)
      .padding(.horizontal, 10)
      .background(getBackgroundColor())
      .clipShape(Capsule())
      .foregroundStyle(getForegroundColor(isPressed: configuration.isPressed))
      .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
  
  private func getBackgroundColor() -> Color {
    if !isActive { return .inactiveCapsuleButton }
    return isPoopDay ? .white : .accent
  }
  
  private func getForegroundColor(isPressed: Bool) -> Color {
    if !isActive { return .darkGrayFont }
    let baseColor: Color = isPoopDay ? .accent : .white
    return isPressed ? baseColor.opacity(0.2) : baseColor
  }
}

#Preview {
  Button("Подключить премиум-аккаунт") {
    
  }
  .buttonStyle(CapsuleButtonStyle(isActive: false))
}
