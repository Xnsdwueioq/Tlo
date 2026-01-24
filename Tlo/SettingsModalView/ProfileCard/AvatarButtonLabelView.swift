//
//  AvatarButtonLabelView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct AvatarButtonLabelView: View {
  var body: some View {
    ZStack {
      Image(.avatar)
        .resizable()
        .frame(width: 70, height: 70)
      ZStack {
        Circle()
          .fill(.white)
          .frame(width: 21)
          
        Image(.pencil)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 18)
      }
      .offset(x: 25, y: -25)
    }
  }
}

#Preview {
  AvatarButtonLabelView()
}
