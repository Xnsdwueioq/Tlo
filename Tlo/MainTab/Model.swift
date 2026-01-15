//
//  Model.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 13.01.2026.
//
import SwiftData
import SwiftUI

enum EntryType {
  case poop
  case expected
}

// model
final class ToiletEntry {
  var id: UUID
  var timestamp: Date
  
  init(for timestamp: Date = Date()) {
    self.id = UUID()
    self.timestamp = timestamp.startOfDay
  }
}

// modelview
@Observable
final class CalendarViewModel {
  let depth = 15
  var selectedDay: Date = Date().startOfDay
  var initDay: Date = Date().startOfDay
  
  var mockEntries: [ToiletEntry] = []
  
  init() {
    // TEST
    let day1 = ToiletEntry(for: daysAgo(5)) // 2 дня подряд (начало)
    let day2 = ToiletEntry(for: daysAgo(4)) // 2 дня подряд (конец)
    let day3 = ToiletEntry(for: daysAgo(2)) // 1 день
    let day4 = ToiletEntry(for: initDay)    // текущий день
    
    self.mockEntries = [day1, day2, day3, day4]
  }
  
  func daysAgo(_ days: Int) -> Date {
    return Calendar.current.date(byAdding: .day, value: -days, to: initDay) ?? Date()
  }
  
  func getWeek(offset: Int = 0) -> [Date] {
    let calendar = Calendar.current
    let today = calendar.startOfDay(for: initDay)
    
    guard let dayOfTargetWeek = calendar.date(byAdding: .weekOfYear, value: offset, to: today),
          let startOfTargetWeek = calendar.dateInterval(of: .weekOfYear, for: dayOfTargetWeek)?.start
    else { return [] }
    
    return (0..<7).compactMap { day in
      calendar.date(byAdding: .day, value: day, to: startOfTargetWeek)
    }
  }
  
  func addEntry() {
    // TEST
    hasEntry(on: selectedDay) ? nil : mockEntries.append(ToiletEntry(for: selectedDay))
  }
  
  func hasEntry(on date: Date) -> Bool {
    // TEST
    mockEntries.contains(where: { $0.timestamp == date.startOfDay })
  }
}

// добавляет переменную, с началом текущего дня
extension Date {
  var startOfDay: Date {
    Calendar.current.startOfDay(for: self)
  }
}
