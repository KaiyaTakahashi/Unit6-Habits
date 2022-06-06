//
//  HabitStatistics.swift
//  Habits
//
//  Created by Kaiya Takahashi on 2022-06-05.
//

import Foundation

struct HabitStatistics {
    let habit: Habit
    let userCounts: [UserCount]
}

extension HabitStatistics: Codable { }
