//
//  ForegroundMainView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct HeaderView: View {
  var selectedDay: Date
  var body: some View {
    VStack {
      HStack {
        // profile image
        Button(action: {
        }, label: {
          Image("Avatar")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
        })
        
        Spacer()
        // selected day
        Text(selectedDay.smartFormatted)
          .animation(.none)
        Spacer()
        
        // calendar
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
  HeaderView(selectedDay: Date())
    .environment(\.locale, Locale(identifier: "ru_RU"))
}

extension Date {
  var smartFormatted: String {
    let calendar = Calendar.current
    let currentYear = calendar.component(.year, from: Date())
    let dateYear = calendar.component(.year, from: self)
    
    if currentYear == dateYear {
      return self.formatted(.dateTime.day().month(.wide).locale(.current))
    } else {
      return self.formatted(.dateTime.day().month(.abbreviated).year().locale(.current))
    }
  }
}
