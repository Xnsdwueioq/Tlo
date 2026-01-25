//
//  AvatarPickerView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

struct AvatarPickerView: View {
  @Environment(UserSession.self) private var userSession
  @State private var animal: AnimalType = .cat
  @State private var circleColor: Color = .accent
  private var withBacking: Color? = .white
  
  var body: some View {
    Group {
      // HEADER
      ZStack {
        SettingsDestinationHeaderView(title: "Создайте аватар")
        HStack {
          Spacer()
          Button("Сохранить") {
          }
          .bold()
        }
        .padding(.horizontal, 15)
      }
      
      VStack(spacing: 15) {
        AnimalAvatarView(animal: animal, circleColor: circleColor, withBacking: withBacking)
          .frame(width: 200)
          .padding(.vertical, 10)
        ColorPickerView(circleColor: $circleColor)
        Divider()
        Text("Animal Picker...")
      }
      Color.clear
    }
    .onAppear {
      let currentAvatar = userSession.selectedAvatar
      animal = currentAvatar.animal
      circleColor = currentAvatar.color
    }
  }
}

#Preview {
  SettingsDestinationView(screen: .avatarPicker)
    .environment(NavigationRouter())
    .environment(UserSession())
}
