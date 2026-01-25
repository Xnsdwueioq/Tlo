//
//  CircleColors.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

enum AvatarColor {
  case bitterSweet
  case blue
  case darkForest
  case magenta
  case magentaRose
  case nightGray
  case orange
  case pink
  case pistachio
  case purple
  case skyBlue
  case spaceCadet
  case thistle
  case yellow
  
  var color: Color {
    switch self {
    case .bitterSweet: return .bitterSweetAvatar
    case .blue:        return .blueAvatar
    case .darkForest:  return .darkForestAvatar
    case .magenta:     return .magentaAvatar
    case .magentaRose: return .magentaRoseAvatar
    case .nightGray:   return .nightGrayAvatar
    case .orange:      return .orangeAvatar
    case .pink:        return .pinkAvatar
    case .pistachio:   return .pistachioAvatar
    case .purple:      return .purpleAvatar
    case .skyBlue:     return .skyBlueAvatar
    case .spaceCadet:  return .spaceCadetAvatar
    case .thistle:     return .thistleAvatar
    case .yellow:      return .yellowAvatar
    }
  }
}
