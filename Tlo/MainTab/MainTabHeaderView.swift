//
//  ForegroundMainView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct MainTabHeaderView: View {
  @Environment(UserSession.self) private var userSession
  @Environment(NavigationRouter.self) private var router
  var selectedDay: Date
  
  var body: some View {
    VStack {
      HStack {
        // Profile image
        Button(action: {
          router.openProfile()
        }, label: {
          AnimalAvatarView(avatarData: userSession.selectedAvatar)
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
  ContentView()
}
