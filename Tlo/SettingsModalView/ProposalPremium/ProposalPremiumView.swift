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
        .font(.subheadline)
        .foregroundStyle(.secondary)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 40)
      StandardCapsuleButton("Подключить тариф «Tlo для семьи»") {
      }
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 15)
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 20))
  }
}

#Preview {
  ProposalPremiumView()
}
