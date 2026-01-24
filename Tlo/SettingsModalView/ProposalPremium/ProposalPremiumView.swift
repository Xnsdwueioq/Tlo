//
//  ProposalPremiumView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct ProposalPremiumView: View {
  var body: some View {
    VStack(spacing: 10) {
      ProposalPremiumAvatarsView()
      Text("Дарите Tlo Premium")
        .font(.headline)
      Text("Пригласите родных и друзей пользоваться вашим планом вместе")
        .foregroundStyle(.secondary)
        .multilineTextAlignment(.center)
      Button("Подключить тариф «Tlo для семьи»") {
      }
      .buttonStyle(CapsuleButtonStyle())
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 15)
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 20))
  }
}

#Preview {
  SettingsModalView()
}
