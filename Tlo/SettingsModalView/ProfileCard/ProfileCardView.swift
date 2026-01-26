//
//  ProfileCardView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct ProfileCardView: View {
  @Environment(UserSession.self) private var userSession
  @Environment(NavigationRouter.self) private var router
  private var settingsRouter: SettingsRouter {
    router.settingsRouter
  }
  
  var body: some View {
    Group {
      ZStack {
        Image(.waterLilyLogo)
          .foregroundStyle(.white)
          .scaleEffect(1.70)
          .offset(x: 100)
        VStack(spacing: 50) {
          HStack(spacing: 15) {
            Button(action: {
              settingsRouter.push(.avatarPicker)
            }) {
              AvatarButtonLabelView()
            }
            .buttonStyle(.plain)
            VStack(alignment: .leading, spacing: 10) {
              Text(userSession.name)
                .fontWeight(.bold)
              Button(action: {
              }) {
                Text("Изменить данные")
                  .fontWeight(.bold)
                  .font(.caption)
                  .foregroundStyle(.darkGrayFont)
              }
              .buttonStyle(.plain)
            }
            Spacer()
          }
          StandardCapsuleButton("Подключить премиум-аккаунт") {
          }
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
    .environment(NavigationRouter())
    .environment(UserSession())
}
