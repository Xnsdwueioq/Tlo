//
//  ForegroundMainView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct HeaderView: View {
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
        
        // current day
        Text(Date().formatted(date: .long, time: .omitted))
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
    .padding(.bottom, 5)
  }
}

#Preview {
  HeaderView()
}
