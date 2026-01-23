//
//  ForegroundMainView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct MainTabHeaderView: View {
  var selectedDay: Date
  
  var body: some View {
    VStack {
      HStack {
        // Profile image
        Button(action: {
        }, label: {
          Image("Avatar")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
        })
        
        Spacer()
        // Selected day
        Text(selectedDay.smartFormatted)
          .animation(.none)
        Spacer()
        
        // Calendar
        Button(action: {
        }, label: {
          Image(systemName: "calendar")
        })
        .font(.title)
        .foregroundStyle(.black)
      }
    }
    .padding(.horizontal, 20)
  }
}

#Preview {
  MainTabHeaderView(selectedDay: Date())
    .environment(\.locale, Locale(identifier: "ru_RU"))
}
