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
    LinearGradient(
      stops: [
        .init(color: isPoopDay ? .accent : .white, location: 0.01),
        .init(color: isPoopDay ? .mainPoopBackground : .white, location: 0.45)
      ],
      startPoint: .bottom,
      endPoint: .top)
  }
  
  func addEllipseGradient(if isPoopDay: Bool) -> LinearGradient {
    LinearGradient(
      stops: [
        .init(color: isPoopDay ? .addPoopShape : .mainNopoopBackground, location: isPoopDay ? 0.35 : 0.6),
        .init(color: isPoopDay ? .accent : .white, location: isPoopDay ? 0.95 : 0.85)
      ],
      startPoint: .top,
      endPoint: .bottomTrailing
    )
  }
  
  func addEllipseMaskGradient(if isPoopDay: Bool) -> LinearGradient {
    LinearGradient(
      stops: [
        .init(color: .black, location: 0.5),
        .init(color: .clear, location: 0.65)
      ],
      startPoint:.bottom,
      endPoint: .top
    )
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
          ZStack {
            Ellipse()
              .fill(
                shapesVM.mainEllipseGradient(if: true)
              )
            Ellipse()
              .fill(
                shapesVM.mainEllipseGradient(if: false)
              )
              .opacity(calendarVM.isPoopDay ? 0 : 1)
          }
          .frame(width: 1600, height: 1200)
          .offset(x: 0, y:-600)
          
          // add ellipse
          ZStack {
            Ellipse()
              .fill(
                shapesVM.addEllipseGradient(if: true)
              )
              .mask(alignment: .center, {
                shapesVM.addEllipseMaskGradient(if: true)
              })
              .opacity(calendarVM.isPoopDay ? 1 : 0)
            Ellipse()
              .fill(
                shapesVM.addEllipseGradient(if: false)
              )
              .opacity(calendarVM.isPoopDay ? 0 : 1)
              .scaleEffect(1.016)
              .blur(radius: 4)

          }
          .frame(width: 530, height: 530)
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
//      .drawingGroup()
      .animation(.easeInOut(duration: 1.0), value: calendarVM.isPoopDay)
  }
}

#Preview {
  let calendarVM = CalendarViewModel()
  ShapesView()
    .environment(calendarVM)
    .onAppear {
      calendarVM.mockEntries = []
    }
    .background(.mainNopoopBackground)
}

#Preview {
  ShapesView()
    .environment(CalendarViewModel())
}

#Preview {
  let calendarVM = CalendarViewModel()
  MainTabView()
    .environment(calendarVM)
    .onAppear {
      calendarVM.mockEntries = []
    }
}
