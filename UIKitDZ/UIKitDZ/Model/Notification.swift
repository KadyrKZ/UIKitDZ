// Notification.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Уведомление
struct Notification {
    /// Никнейм пользователя
    let name: String
    /// Фото пользователя
    let image: String
    /// Описание
    let description: String
    /// Время публикации
    let timeNotified: TimeNotified
    /// Фото
    let picture: String
    /// Подписан ли
    let isFollowing: Bool
}

/// Время для уведомлении
enum TimeNotified {
    /// Сегодня
    case today
    /// На этой неделе
    case thisWeek
}
