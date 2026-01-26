//
//  AvatarPickerView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

@Observable
class AvatarPickerViewModel {
  var userSession: UserSession
  
  var animal: AnimalType
  var circleColor: Color
  
  init(userSession: UserSession, animal: AnimalType, circleColor: Color) {
    self.userSession = userSession
    let selectedAvatar = userSession.selectedAvatar
    
    self.animal = selectedAvatar.animal
    self.circleColor = selectedAvatar.color
  }
  
  func saveAvatar() {
    var updatedAvatar = userSession.selectedAvatar
    updatedAvatar.animal = animal
    updatedAvatar.color = circleColor
    
    userSession.selectedAvatar = updatedAvatar
  }
}

struct AvatarPickerView: View {
  @Environment(UserSession.self) private var userSession
  @State private var animal: AnimalType = .cat
  @State private var circleColor: Color = .accent
  private var withBacking: Color? = .white
  private let avatarSize: CGFloat = 200
  
  var body: some View {
    VStack(spacing: 0) {
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
          .scaledToFit()
          .aspectRatio(contentMode: .fit)
          .frame(width: avatarSize, height: avatarSize)
          .padding(.vertical, 10)
        ColorPickerView(circleColor: $circleColor)
        VStack(spacing: 0) {
          Divider()
          AnimalPickerView(animal: $animal)
        }
      }
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
