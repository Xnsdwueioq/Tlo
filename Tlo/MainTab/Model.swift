//
//  Model.swift
//  Tlo
//
//  Created by Eyhciurmrn Zmpodackrl on 13.01.2026.
//
import SwiftData
import SwiftUI

struct CalendarLogicEngine {
  let calendar = Calendar.current
  
  func calculateOrderNum(for date: Date, entries: [ToiletEntry]) -> (String, Int) {
    var orderNum = 1
    
    guard !entries.isEmpty,
          date >= entries.first?.timestamp ?? Date(timeIntervalSince1970: 0) else { return ("Прошлое", 0) }
    
    if let dateIndex = entries.firstIndex(where: { $0.timestamp == date }) {
      var i = dateIndex
      var isPresent = true
      while (i > 0 && isDatesAreConsecutive(for: entries[i].timestamp, and: entries[i-1].timestamp)) {
        orderNum += 1
        isPresent = true
        i -= 1
      }
      return (isPresent ? "Каканье:" : "Прошлое: каканье", orderNum)
    }
    
    var index = entries.count - 1
    var isPresent = true
    while (index > 0 && (entries[index].timestamp > date)) {
      index -= 1
      isPresent = false
    }
    orderNum = getDiffInDaysBetweenDates(for: entries[index].timestamp, and: date)
    
    return (isPresent ? (orderNum < 7 ? "Без каканья:" : "Без каканья (жестко):") : "Прошлое: без каканья", orderNum)
  }
  
  func isDatesAreConsecutive(for date1: Date, and date2: Date) -> Bool {
    return getDiffInDaysBetweenDates(for: date1, and: date2) == 1
  }
  
  func getDiffInDaysBetweenDates(for date1: Date, and date2: Date) -> Int {
    return abs(Calendar.current.dateComponents([.day], from: date1, to: date2).day ?? 0)
  }
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
  var logicEngine = CalendarLogicEngine()
  var initDay: Date = Date().startOfDay
  var selectedDay: Date = Date().startOfDay {
    didSet {
      updateStatus()
    }
  }
  var currentStatus: (String, Int) = ("", 0)
  
  var mockEntries: [ToiletEntry] = []
  
  init() {
    // TEST
    let day1 = ToiletEntry(for: daysAgo(5)) // 2 дня подряд (начало)
    let day2 = ToiletEntry(for: daysAgo(4)) // 2 дня подряд (конец)
    let day3 = ToiletEntry(for: daysAgo(2)) // 1 день
    let day4 = ToiletEntry(for: initDay)    // текущий день
    
    self.mockEntries = [day1, day2, day3, day4]
  }
  
  func updateStatus() {
    self.currentStatus = getSelectedDayStatus() // вычисляется только при обновлении дня
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
  
  func getSelectedDayStatus() -> (String, Int) {
    return logicEngine.calculateOrderNum(for: selectedDay, entries: mockEntries)
  }
}

// добавляет переменную, с началом текущего дня
extension Date {
  var startOfDay: Date {
    Calendar.current.startOfDay(for: self)
  }
}
