//
//  AnimalPickerView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 27.01.2026.
//

import SwiftUI

struct AnimalPickerView: View {
  @Binding var animal: AnimalType
  private let avatarSize: CGFloat = 80
  
  var body: some View {
    HStack(spacing: 5) {
      ForEach(AnimalType.allCases, id:\.self) { animal in
        AnimalAvatarView(animal: animal, circleColor: .mainNopoopBackground.mix(with: .gray, by: 0.2), withBacking: .white)
          .addStroke(lineWidth: animal == self.animal ? 2 : 0)
          .frame(width: avatarSize, height: avatarSize)
          .onTapGesture {
              self.animal = animal
          }
      }
    }
    .padding(15)
  }
}

#Preview {
  @Previewable @State var userSession = UserSession()
  AnimalPickerView(animal: $userSession.selectedAvatar.animal)
}

#Preview {
  SettingsDestinationView(screen: .avatarPicker)
    .environment(NavigationRouter())
    .environment(UserSession())
}
