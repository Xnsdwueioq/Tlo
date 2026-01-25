//
//  UserGoalView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

struct UserGoalView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      Text("Цель использования:")
        .padding(.horizontal, 15)
        .font(.title)
        .bold()
      UserGoalSelectionView()
    }
    .padding(.vertical, 10)
  }
}

#Preview {
  UserGoalView()
    .background(.mainNopoopBackground)
}
