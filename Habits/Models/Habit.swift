//
//  Habit.swift
//  Habits
//
//  Created by Kaiya Takahashi on 2022-06-02.
//

import Foundation

struct Habit: Comparable {
    static func < (lhs: Habit, rhs: Habit) -> Bool {
        return lhs.name > rhs.name
    }
    
    let name: String
    let category: Category
    let info: String
}

extension Habit: Codable { }

extension Habit: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Habit, rhs: Habit) -> Bool {
        return lhs.name == rhs.name
    }
}
