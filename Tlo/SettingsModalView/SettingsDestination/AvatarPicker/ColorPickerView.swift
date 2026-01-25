//
//  ColorPickerView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 25.01.2026.
//

import SwiftUI

struct ColorPickerView: View {
  @Binding var circleColor: Color
  
  var body: some View {
    ScrollView(.horizontal) {
      HStack(spacing: 15) {
        ForEach(AvatarColor.allCases, id: \.rawValue) { avatarColor in
          let color = avatarColor.color
          AnimalAvatarView(circleColor: avatarColor.color, withBacking: .white, animalOpacity: 0)
            .addStroke(lineWidth: color == circleColor ? 2 : 0)
            .frame(height: 55)
            .onTapGesture {
              withAnimation(.easeInOut(duration: 0.3)) {
                circleColor = color
              }
            }
        }
      }
      .padding(.horizontal, 15)
    }
    .scrollIndicators(.never)
  }
}

#Preview {
  ColorPickerView(circleColor: .constant(.bitterSweetAvatar))
}
