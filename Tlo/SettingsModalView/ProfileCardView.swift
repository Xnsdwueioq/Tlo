//
//  ProfileCardView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct ProfileCardView: View {
  var body: some View {
    VStack(spacing: 50) {
      HStack(spacing: 15) {
        Image("Avatar")
          .resizable()
          .frame(width: 70, height: 70)
        VStack(alignment: .leading, spacing: 10) {
          Text("Gugibird")
            .bold()
          Text("Изменить данные")
            .fontWeight(.bold)
            .font(.caption2)
            .foregroundStyle(.gray)
        }
        Spacer()
      }
      
      Button("Подключить премиум-аккаунт") {
      }
        .buttonStyle(CapsuleButtonStyle())
    }
    .padding(.vertical, 40)
    .padding(.horizontal, 15)
    RoundedRectangle(cornerRadius: 15)
      .frame(height: 250)
      .foregroundStyle(.clear)
      .shadow(radius: 100)
      .background(
        Image(.waterLilyLogo)
          .foregroundStyle(.white)
          .scaleEffect(1.85)
          .offset(x: 60)
      )
  }
}

#Preview {
  ProfileCardView()
    .background(
      Color.background
    )
}
