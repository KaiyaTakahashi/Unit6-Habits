//
//  UserStatistics.swift
//  Habits
//
//  Created by Kaiya Takahashi on 2022-06-05.
//

import Foundation

struct UserStatistics {
    let user: User
    let habitCounts: [HabitCount]
}

extension UserStatistics: Codable { }
