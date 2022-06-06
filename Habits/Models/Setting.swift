//
//  Setting.swift
//  Habits
//
//  Created by Kaiya Takahashi on 2022-06-03.
//

import Foundation

struct Settings {
    
    static var shared = Settings()
    
    private let defaults = UserDefaults.standard
    
    var followedUserIDs: [String] {
        get {
            return unarchiveJSON(key: Setting.followedUserIDs) ?? []
        }
        set {
            archiveJSON(value: newValue, key: Setting.followedUserIDs)
        }
    }
    
    func archiveJSON<T: Encodable>(value: T, key: String) {
        let data = try! JSONEncoder().encode(value)
        let string = String(data: data, encoding: .utf8)
        defaults.set(string, forKey: key)
    }
    
    func unarchiveJSON<T: Decodable>(key: String) -> T? {
        guard let string = defaults.string(forKey: key), let data = string.data(using: .utf8) else {
            return nil
        }
        return try! JSONDecoder().decode(T.self, from: data)
    }
    
    var favoriteHabits: [Habit] {
        get {
            return unarchiveJSON(key: Setting.favoriteHabits) ?? []
        }
        set {
            return archiveJSON(value: newValue, key: Setting.favoriteHabits)
        }
    }
    
    enum Setting {
        static let favoriteHabits = "favoriteHabits"
        static let followedUserIDs = "followedUserIDs"
    }
    
    mutating func toggleFavourite(_ habit: Habit) {
        var favourites = favoriteHabits
        
        if favourites.contains(habit) {
            favourites = favourites.filter{ $0 != habit }
        } else {
            favourites.append(habit)
        }
        
        favoriteHabits = favourites
    }
    
    mutating func toggleFollowed(_ user: User) {
        var updated = followedUserIDs
        
        if updated.contains(user.id) {
            updated = updated.filter { $0 != user.id }
        } else {
            updated.append(user.id)
        }
        
        followedUserIDs = updated
    }
    
    let currentUser = User(id: "activeUser", name: "Kaiya Takahashi", color: nil, bio: nil)
    
}
