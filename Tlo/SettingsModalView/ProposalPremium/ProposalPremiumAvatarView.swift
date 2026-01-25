//
//  ProposalPremiumAvatarView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct ProposalPremiumAvatarsView: View {
  @State private var isAnimated = false
  
  private let avatars: [AvatarData] = [
    .init(animal: .cat, color: .purpleAvatar),
    .init(animal: .owl, color: .yellowAvatar),
    .init(animal: .badger, color: .pinkAvatar),
    .init(animal: .racoon, color: .skyBlueAvatar),
    .init(animal: .cheetah, color: .magentaAvatar),
  ]
  private let backgroundColor: Color = .white
  private let overlap: CGFloat = 18
  private let avatarHeight: CGFloat = 60
  
  var body: some View {
    HStack(spacing: -overlap) {
      ForEach(avatars.enumerated(), id: \.element.id) { index, avatar in
        AnimalAvatarView(animal: avatar.animal, circleColor: avatar.color, withBacking: backgroundColor, innerPadding: 3)
          .frame(width: avatarHeight)
          .zIndex(Double(avatars.count - index))
          .scaleEffect(isAnimated ? 1 : 0.5)
          .opacity(isAnimated ? 1 : 0)
          .offset(y: isAnimated ? 0 : 20)
          .animation(
            .spring(response: 0.7, dampingFraction: 0.5)
            .delay(Double(index) * 0.1),
            value: isAnimated
          )
      }
    }
    .frame(height: avatarHeight)
    .onAppear {
      isAnimated = true
    }
  }
}

#Preview {
  ProposalPremiumView()
}
