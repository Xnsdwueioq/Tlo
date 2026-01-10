//
//  SwiftUIView.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 10.01.2026.
//

import SwiftUI

struct StatusView: View {
  var body: some View {
    VStack {
      TextStatusView()
      StatusButtonView()
    }
  }
}

#Preview {
  ZStack {
    Color.brown
    StatusView()
  }
}
