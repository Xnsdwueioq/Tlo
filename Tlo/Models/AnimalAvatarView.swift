//
//  AnimalAvatarView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct AvatarData: Identifiable {
  let id = UUID()
  var animal: AnimalType = .cat
  var color: Color = .accent
  var isBacking: Color? = nil
}

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
    case .cheetah: return .сheetahAvatar
    }
  }
}

struct AnimalAvatarView: View {
  var animal: AnimalType = .cat
  var circleColor: Color = .accent
  var withBacking: Color? = nil
  var body: some View {
    ZStack {
      Circle()
        .fill(withBacking != nil ? withBacking! : .clear)
      Circle()
        .scale(withBacking != nil ? 0.9 : 1)
        .foregroundStyle(circleColor)
      Image(animal.image)
        .resizable()
        .scaledToFit()
        .scaleEffect(withBacking != nil ? 0.9 : 1)
    }
  }
}

#Preview {
  ZStack {
    Color.clear
      .background(Color.green.gradient)
    AnimalAvatarView(animal: .cat, circleColor: .purple, withBacking: nil)
  }
}
