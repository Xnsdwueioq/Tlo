//
//  UserGoalSelectionView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

enum UserGoal: String, CaseIterable, Identifiable {
  case track
  case fertility
  case selfDiscovery
  
  var id: String { rawValue }
  
  var title: String {
    switch self {
    case .track: return "Отслеживать стул"
    case .fertility: return "Забеременеть"
    case .selfDiscovery: return "Понять себя"
    }
  }
}

struct UserGoalSelectionView: View {
  @Environment(UserSession.self) private var userSession

  var body: some View {
    ScrollView(.horizontal, content: {
      HStack(spacing: 15) {
        ForEach(UserGoal.allCases) { goal in
          StandardCapsuleButton(goal.title, isActive: userSession.userGoal == goal) {
            userSession.userGoal = goal
          }
        }
      }
      .padding(.horizontal, 15)
    })
    .scrollIndicators(.never)
  }
}

#Preview {
  UserGoalSelectionView()
    .environment(UserSession())
}
