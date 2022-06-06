//
//  UserCount.swift
//  Habits
//
//  Created by Kaiya Takahashi on 2022-06-05.
//

import Foundation

struct UserCount {
    let user: User
    let count: Int
}

extension UserCount: Codable { }

extension UserCount: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(user)
    }
    
    static func ==(_ lhs: UserCount, _ rhs: UserCount) -> Bool {
        return lhs.user == rhs.user
    }
}
