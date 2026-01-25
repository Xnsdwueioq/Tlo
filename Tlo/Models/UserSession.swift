//
//  UserSession.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

@Observable
class UserSession {
  var name: String = "Gu-gi Bird"
  var selectedAvatar: AvatarData = .init(animal: .cat, color: .accent)
  var userGoal: UserGoal = .track
}
