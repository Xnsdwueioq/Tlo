//
//  ProfileCardView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct ProfileCardView: View {
  var body: some View {
    Group {
      ZStack {
        Image(.waterLilyLogo)
          .foregroundStyle(.white)
          .scaleEffect(1.70)
          .offset(x: 100)
        VStack(spacing: 50) {
          HStack(spacing: 15) {
            Button(action: {} ){
              AvatarButtonLabelView()
            }
            VStack(alignment: .leading, spacing: 10) {
              Text("Gugibird")
                .fontWeight(.bold)
              Text("Изменить данные")
                .fontWeight(.bold)
                .font(.caption)
                .foregroundStyle(.darkGrayFont)
            }
            Spacer()
          }
          Button("Подключить премиум-аккаунт") {
          }
            .buttonStyle(CapsuleButtonStyle())
        }
      }
      .padding(.vertical, 40)
      .padding(.horizontal, 15)
      .background(.mainNopoopBackground)
    }
    .clipShape(
      RoundedRectangle(cornerRadius: 20)
    )
    .shadow(radius: 2, y: 2)
  }
}

#Preview {
  ProfileCardView()
}
