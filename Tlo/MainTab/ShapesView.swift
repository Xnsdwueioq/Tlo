//
//  ShapesView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

@Observable
class ShapesViewModel {
  func mainEllipseGradient(if isPoopDay: Bool) -> LinearGradient {
    LinearGradient(colors: [isPoopDay ?  .accent.opacity(0.8) : .white.opacity(0.8), .accent.opacity(0.15), .accent.opacity(0.05), .clear], startPoint: .bottom, endPoint: .top)
  }
  
  func addEllipseGradient(if isPoopDay: Bool) -> LinearGradient {
    LinearGradient(
      colors: isPoopDay ? [.black, .black, .clear] : [.black, .clear],
      startPoint: .bottom,
      endPoint: isPoopDay ? .top : .topTrailing)
  }
  
  func addEllipseRadialGradient(if isPoopDay: Bool) -> RadialGradient {
    RadialGradient(colors: isPoopDay ? [.accent, .white] : [.accent.opacity(0.2), .white], center: isPoopDay ?  .bottomTrailing : .leading, startRadius: 1, endRadius: 700)
  }
}

struct ShapesView: View {
  @Environment(CalendarViewModel.self) private var calendarVM
  @State private var shapesVM = ShapesViewModel()
  
  var body: some View {
    Color.clear
      .overlay(content: {
        ZStack {
          // main ellipse
          Ellipse()
            .fill(
              shapesVM.mainEllipseGradient(if: calendarVM.isPoopDay)
            )
            .frame(width: 1600, height: 1200)
            .offset(x: 0, y:-600)
          
          // add ellipse
          Ellipse()
            .fill(
              shapesVM.addEllipseRadialGradient(if: calendarVM.isPoopDay)
            )
            .frame(width: 530, height: 530)
            .opacity(0.7)
            .mask(
              shapesVM.addEllipseGradient(if: calendarVM.isPoopDay)
            )
            .offset(x: 120, y: -330)
            .blur(radius: 2)
            .phaseAnimator([false, true, true, false]) { content, isExpanded in
              content.offset(x: isExpanded ? -20 : 0, y: isExpanded ? 40 : 0)
            } animation: { isExpanded in
              switch isExpanded {
              case true: .easeInOut(duration: 7)
              case false: .easeInOut(duration: 5)
              }
            }
          
        }
      })
      .animation(.easeInOut(duration: 0.5), value: calendarVM.isPoopDay)
  }
}

#Preview {
  ShapesView()
    .environment(CalendarViewModel())
}
