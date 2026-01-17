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
    let calendar = Calendar.current
    let targetDate = date.startOfDay
    let setOfDates = Set(entries.map { $0.timestamp })
    
    if setOfDates.contains(targetDate) {
      var streak = 1
      var current = targetDate
      
      while let prevDate = calendar.date(byAdding: .day, value: -1, to: current),
            setOfDates.contains(prevDate) {
        streak += 1
        current = prevDate
      }
      
      return ("Какать:", streak)
    }
    
    if let lastEntry = entries.last(where: { $0.timestamp < targetDate }) {
      let diff = getDiffInDaysBetweenDates(for: lastEntry.timestamp, and: targetDate)
      return (diff < 7 ? "Не какать:" : "Не какать (жестко):", diff)
    }
  
    return ("Не какать:", 0)
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
  let depth = 5
  var logicEngine = CalendarLogicEngine()
  
  var initDay: Date = Date().startOfDay
  var startOfInitWeek: Date {
    return Calendar.current.dateInterval(of: .weekOfYear, for: initDay)!.start
  }
  
  var selectedDay: Date = Date().startOfDay
  var dayIndex: Int {
    Calendar.current.dateComponents([.day], from: initDay, to: selectedDay).day ?? 0
  }
  var weekIndex: Int {
    let calendar = Calendar.current
    let startOfSelectedDay = calendar.dateInterval(of: .weekOfYear, for: selectedDay)!.start
    
    return (calendar.dateComponents([.weekOfYear], from: startOfInitWeek, to: startOfSelectedDay).weekOfYear ?? 0)
  }
  
  func updateDayIndex(new index: Int) {
    selectedDay = Calendar.current.date(byAdding: .day, value: index, to: initDay) ?? initDay
  }
  func updateWeekIndex(new index: Int) {
    let calendar = Calendar.current
    let weekDayUniversal = getWeekDayUniversal(from: selectedDay) - 1
    let startOfTargetWeek = calendar.date(byAdding: .weekOfYear, value: index, to: startOfInitWeek) ?? initDay
    selectedDay = calendar.date(byAdding: .day, value: weekDayUniversal, to: startOfTargetWeek) ?? initDay
  }
  
  // in (1;7)
  func getWeekDayUniversal(from date: Date) -> Int {
    let calendar = Calendar.current
    let firstDay = calendar.firstWeekday
    let weekDayAmerican = abs(calendar.component(.weekday, from: date))
    let weekDayUniversal = (weekDayAmerican - firstDay + 7) % 7 + 1
    return weekDayUniversal
  }
  
  // TEST
  var mockEntries: [ToiletEntry] = []
  
  init() {
    // TEST
    let day1 = ToiletEntry(for: daysAgo(5)) // 2 дня подряд (начало)
    let day2 = ToiletEntry(for: daysAgo(4)) // 2 дня подряд (конец)
    let day3 = ToiletEntry(for: daysAgo(2)) // 1 день
    let day4 = ToiletEntry(for: initDay)    // текущий день
    
    self.mockEntries = [day1, day2, day3, day4]
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
  
  func getDay(offset: Int = 0) -> (String, Int) {
    let calendar = Calendar.current
    
    guard let targetDay = calendar.date(byAdding: .day, value: offset, to: initDay) else { return ("", 0)}
    return logicEngine.calculateOrderNum(for: targetDay, entries: mockEntries)
  }
  
  func addEntry() {
    // TEST
    if !hasEntry(on: selectedDay) {
      mockEntries.append(ToiletEntry(for: selectedDay))
      mockEntries.sort { $0.timestamp < $1.timestamp }
    }
  }
  
  func hasEntry(on date: Date) -> Bool {
    // TEST
    mockEntries.contains(where: { $0.timestamp == date.startOfDay })
  }
  
  func daysAgo(_ days: Int) -> Date {
    // TEST
    return Calendar.current.date(byAdding: .day, value: -days, to: initDay) ?? Date()
  }
}

// добавляет переменную, с началом текущего дня
extension Date {
  var startOfDay: Date {
    Calendar.current.startOfDay(for: self)
  }
}
