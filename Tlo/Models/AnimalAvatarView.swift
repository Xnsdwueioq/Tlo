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
  var animalOpacity: Double = 1
  var innerPadding: Double = 7
  
  init(animal: AnimalType = .cat, circleColor: Color = .accent, withBacking: Color? = nil, animalOpacity: Double = 1, innerPadding: Double = 7) {
    self.animal = animal
    self.circleColor = circleColor
    self.withBacking = withBacking
    self.animalOpacity = animalOpacity
    self.innerPadding = innerPadding
  }
  
  init(avatarData: AvatarData) {
    self.animal = avatarData.animal
    self.circleColor = avatarData.color
  }
  
  
  
  var body: some View {
    ZStack {
      Circle()
        .fill(withBacking != nil ? withBacking! : .clear)
      Circle()
        .padding(withBacking != nil ? innerPadding : 0)
        .foregroundStyle(circleColor)
      Image(animal.image)
        .resizable()
        .scaledToFit()
        .padding(withBacking != nil ? innerPadding : 0)
        .opacity(animalOpacity)
    }
  }
}

extension AnimalAvatarView {
  func addStroke(lineWidth: CGFloat = 2) -> some View {
    self.overlay(
      Circle()
        .inset(by: lineWidth / 2)
        .stroke(Color.accent, lineWidth: lineWidth)
        
    )
  }
}

#Preview {
  ZStack {
    Color.clear
      .background(Color.green.gradient)
    AnimalAvatarView(animal: .cat, circleColor: .bitterSweetAvatar, withBacking: .white, animalOpacity: 0.5).addStroke(lineWidth: 7)
  }
}

#Preview {
  ColorPickerView(circleColor: .constant(.bitterSweetAvatar))
}



