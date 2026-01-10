//
//  WeekView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct WeekView: View {
  let today = Date()
  
  var body: some View {
    // days abbrev
    VStack {
      HStack (spacing: 46) {
        Text("П")
        Text("В")
        Text("С")
        Text("Ч")
        Text("П")
        Text("С")
        Text("В")
      }
      .font(.caption2)
      .foregroundStyle(.gray)
      
      // days of week
      HStack(spacing: 21) {
        Button("1") {
          
        }.buttonStyle(PoopDayStyle())
        Button("2") {
          
        }.buttonStyle(PoopDayStyle())
        Button("3") {
          
        }.buttonStyle(PoopDayStyle())
        Button("4") {
          
        }.buttonStyle(PoopDayStyle())
        Button("5") {
          
        }.buttonStyle(NormalDayStyle())
        Button("6") {
          
        }.buttonStyle(ExpectedDayStyle())
        Button("25") {
          
        }.buttonStyle(PoopDayStyle())
      }
    }
  }
}

#Preview {
  MainTabView()
}
