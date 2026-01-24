//
//  AnimalAvatarView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

enum AnimalType: String, CaseIterable {
  case cat
  case owl
  case badger
  case racoon
  case cheetah
  
  var image: ImageResource {
    switch self {
    case .cat: return .catAvatar
    case .owl: return .owlAvatar
    case .badger: return .badgerAvatar
    case .racoon: return .racoonAvatar
    case .cheetah: return .racoonAvatar
    }
  }
}

struct AnimalAvatarView: View {
  var animal: AnimalType = .cat
  var circleColor: Color = .accent
  var withBacking: Bool = false
  
  var body: some View {
    ZStack {
      Circle()
        .fill(.clear)
      Circle()
        .scale(withBacking ? 0.9 : 1)
        .foregroundStyle(circleColor)
      Image(animal.image)
        .resizable()
        .scaledToFit()
        .scaleEffect(withBacking ? 0.9 : 1)
    }
  }
}

#Preview {
  ZStack {
    Color.clear
      .background(Color.green.gradient)
    AnimalAvatarView(animal: .cat, circleColor: .purple, withBacking: false)
  }
}
