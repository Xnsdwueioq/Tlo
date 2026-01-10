//
//  MarkButtonView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 22.12.2025.
//

import SwiftUI

struct StatusButtonView: View {
  var body: some View {
    Button(action: {
      
    }, label: {
      Text("Изменить даты каканья")
    })
    .buttonStyle(CapsuleButtonStyle())
  }
}



#Preview {
  StatusButtonView()
}
