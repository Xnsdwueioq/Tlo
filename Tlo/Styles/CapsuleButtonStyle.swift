//
//  ButtonStyles.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
  var isPoopDay: Bool = false
  var isBold: Bool = false
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.footnote)
      .fontWeight(isBold ? .heavy : .semibold)
      .padding(8)
      .padding(.horizontal, 10)
      .background(isPoopDay ? Color.white : .accent)
      .clipShape(Capsule())
      .foregroundStyle(configuration.isPressed ? (isPoopDay ? Color.accent : .white).opacity(0.2) : (isPoopDay ? Color.accent : .white).opacity(1))
      .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}

#Preview {
  Button("Подключить премиум-аккаунт") {
    
  }
  .buttonStyle(CapsuleButtonStyle())
}
