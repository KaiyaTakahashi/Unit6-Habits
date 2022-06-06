//
//  CombinedStatics.swift
//  Habits
//
//  Created by Kaiya Takahashi on 2022-06-05.
//

import Foundation

struct CombinedStatistics {
    let userStatistics: [UserStatistics]
    let habitStatistics: [HabitStatistics]
}

extension CombinedStatistics: Codable { }
