//
//  ShapesView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct ShapesView: View {
  var body: some View {
    Color.clear
      .overlay(content: {
        ZStack {
          // main ellipse
          Ellipse()
            .fill(
              LinearGradient(colors: [.accent.opacity(0.8), .accent.opacity(0.15), .accent.opacity(0.05), .clear], startPoint: .bottom, endPoint: .top)
            )
            .frame(width: 1600, height: 1200)
            .offset(x: 0, y:-600)
          
          // add ellipse
          Ellipse()
            .fill(
              RadialGradient(colors: [.accent, .white], center: .bottomTrailing, startRadius: 1, endRadius: 700)
            )
            .frame(width: 530, height: 530)
            .opacity(0.7)
            .mask(
              LinearGradient(
                colors: [.black, .clear],
                startPoint: .bottom,
                endPoint: .topLeading
              )
              .offset(x: -170, y: 0)
            )
            .offset(x: 120, y: -330)
            .blur(radius: 2)
            
        }
      })
  }
}

#Preview {
  ShapesView()
}
