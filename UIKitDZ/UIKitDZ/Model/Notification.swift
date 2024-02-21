// Notification.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Уведомление
struct Notification {
    let name: String
    let image: String
    let description: String
    let timeNotified: TimeNotified
    let picture: String
    let isFollowing: Bool
}

/// Время для уведомлении
enum TimeNotified {
    case today
    case thisWeek
}
