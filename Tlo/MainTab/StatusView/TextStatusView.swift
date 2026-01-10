//
//  CurrentStatusView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct TextStatusView: View {
  var body: some View {
    VStack(spacing: 5) {
      Text("Какать:")
        .bold()
      Text("N-й день")
        .font(.system(size: 48, weight: .bold))
    }
  }
}

#Preview {
  TextStatusView()
}
