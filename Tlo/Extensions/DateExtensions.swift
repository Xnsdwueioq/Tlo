//
//  DateExtensions.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 23.01.2026.
//

import SwiftUI

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

extension Date {
  var startOfDay: Date {
    Calendar.current.startOfDay(for: self)
  }
}
