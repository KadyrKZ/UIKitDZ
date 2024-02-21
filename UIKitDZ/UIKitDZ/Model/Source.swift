// Source.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Структура для постов
struct Source {
    // Все посты
    let posts = ["firstPost", "secondPost", "thirdPost", "forthPost"]
    let story: [Story] = [
        Story(name: "lavanda123", photo: "lavanda123", viewed: true),
        Story(name: "lavanda123", photo: "lavanda123", viewed: true),
        Story(name: "lavanda123", photo: "lavanda123", viewed: true),
        Story(name: "lavanda123", photo: "lavanda123", viewed: false),
        Story(name: "lavanda123", photo: "lavanda123", viewed: false),
        Story(name: "lavanda123", photo: "lavanda123", viewed: false),
        Story(name: "lavanda123", photo: "lavanda123", viewed: false),
        Story(name: "lavanda123", photo: "lavanda123", viewed: false),
        Story(name: "lavanda123", photo: "lavanda123", viewed: false),
        Story(name: "lavanda123", photo: "lavanda123", viewed: false),
        Story(name: "lavanda123", photo: "lavanda123", viewed: false)
    ]

    func getPost(index: Int) -> String {
        posts[index]
    }

    // Все рекоммендационные посты
    let recommend: [Recommend] = [
        Recommend(name: "сrimea_082", photo: "recommendImage"),
        Recommend(name: "сrimea_082", photo: "recommendImage"),
        Recommend(name: "сrimea_082", photo: "recommendImage"),
        Recommend(name: "сrimea_082", photo: "recommendImage"),
    ]
    /// Все остальные посты
    let otherPosts: [Other] = [
        Other(name: "tur_v_dagestan", photo: "dagestan", friendPhoto: "friend", myPhoto: "myPhoto"),
        Other(name: "tur_v_dagestan", photo: "dagestan", friendPhoto: "friend", myPhoto: "myPhoto"),
        Other(name: "tur_v_dagestan", photo: "dagestan", friendPhoto: "friend", myPhoto: "myPhoto"),
        Other(name: "tur_v_dagestan", photo: "dagestan", friendPhoto: "friend", myPhoto: "myPhoto"),
        Other(name: "tur_v_dagestan", photo: "dagestan", friendPhoto: "friend", myPhoto: "myPhoto"),
    ]
    /// первый пост
    let firstPost: Other = .init(name: "tur_v_dagestan", photo: "dagestan", friendPhoto: "friend", myPhoto: "myPhoto")

    static func makeContacts() -> [Notification] {
        [
            .init(
                name: "Anna",
                image: UIImage(named: "lavanda123"),
                description: Description.description,
                timeNotified: .today,
                picture: UIImage(named: "picture"), isFollowing: false
            ),
            .init(
                name: "Arina",
                image: UIImage(named: "lavanda123"),
                description: Description.description,
                timeNotified: .today,
                picture: UIImage(named: "picture"), isFollowing: false
            ),
            .init(
                name: "Selena",
                image: UIImage(named: "lavanda123"),
                description: Description.description,
                timeNotified: .today,
                picture: UIImage(named: "picture"), isFollowing: false
            ),
            .init(
                name: "Selena",
                image: UIImage(named: "lavanda123"),
                description: Description.description,
                timeNotified: .today,
                picture: nil, isFollowing: false
            ),
            .init(
                name: "Kadyr",
                image: UIImage(named: "lavanda123"),
                description: Description.description2,
                timeNotified: .thisWeek,
                picture: nil, isFollowing: true
            ), .init(
                name: "Murka",
                image: UIImage(named: "lavanda123"),
                description: Description.description,
                timeNotified: .thisWeek,
                picture: nil, isFollowing: true
            ),
            .init(
                name: "Lara",
                image: UIImage(named: "lavanda123"),
                description: Description.description,
                timeNotified: .thisWeek,
                picture: UIImage(named: "picture"), isFollowing: false
            ),
        ]
    }

    static func makeContactsWithGroup() -> [[Notification]] {
        let today = makeContacts().filter { $0.timeNotified == .today }
        let thisWeek = makeContacts().filter { $0.timeNotified == .thisWeek }
        return [today, thisWeek]
    }
}

/// Структура для сторисов
struct Story {
    let name: String
    let photo: String
    let viewed: Bool
}

//  Структура для рекоммендации
struct Recommend {
    let name: String
    let photo: String
}

/// Структура для остальных постов
struct Other {
    let name: String
    let photo: String
    let friendPhoto: String
    let myPhoto: String
}

/// Структура уведомлении
struct Notification {
    let name: String
    let image: UIImage?
    let description: String
    let timeNotified: TimeNotified
    let picture: UIImage?
    let isFollowing: Bool
}

/// Время для уведомлении
enum TimeNotified {
    case today
    case thisWeek
}

/// Описание для уведомлении
struct Description {
    static let description = "приятная девушка"
    static let description2 = "приятный человек"
}
