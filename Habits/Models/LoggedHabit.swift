//
//  LoggedHabit.swift
//  Habits
//
//  Created by Kaiya Takahashi on 2022-06-05.
//

import Foundation

struct LoggedHabit {
    let userID: String
    let habitName: String
    let timestamp: Date
}

extension LoggedHabit: Codable { }
