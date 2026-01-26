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
  
  let avatarBacking: Color? = .white
  let avatarSize: CGFloat = 200
  
  init(userSession: UserSession) {
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
  @Environment(NavigationRouter.self) private var router
  @Bindable var viewModel: AvatarPickerViewModel
  
  var body: some View {
    VStack(spacing: 0) {
      // HEADER
      ZStack {
        SettingsDestinationHeaderView(title: "Создайте аватар")
        HStack {
          Spacer()
          Button("Сохранить") {
            viewModel.saveAvatar()
            router.settingsRouter.removeLast()
          }
          .bold()
        }
        .padding(.horizontal, 15)
      }
      
      VStack(spacing: 15) {
        AnimalAvatarView(animal: viewModel.animal, circleColor: viewModel.circleColor, withBacking: viewModel.avatarBacking)
          .scaledToFit()
          .aspectRatio(contentMode: .fit)
          .frame(width: viewModel.avatarSize, height: viewModel.avatarSize)
          .padding(.vertical, 10)
        ColorPickerView(circleColor: $viewModel.circleColor)
        VStack(spacing: 0) {
          Divider()
          AnimalPickerView(animal: $viewModel.animal)
        }
      }
    }
  }
}

#Preview {
  SettingsDestinationView(screen: .avatarPicker)
    .environment(NavigationRouter())
    .environment(UserSession())
}
