//
//  HeaderView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 24.01.2026.
//

import SwiftUI

struct HeaderView: View {
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    ZStack {
      Text("Настройки")
        .font(.title3)
        .bold() 
      HStack {
        Button(action: { dismiss() }) {
          Image(systemName: "xmark")
            .font(.title)
            .foregroundStyle(.black)
        }
        Spacer()
      }
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 10)
  }
}

#Preview {
  HeaderView()
}
