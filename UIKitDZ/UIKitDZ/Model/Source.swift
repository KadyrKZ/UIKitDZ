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
    let recommendation: [Recommendation] = [
        Recommendation(name: "сrimea_082", photo: "recommendationImage"),
        Recommendation(name: "сrimea_082", photo: "recommendationImage"),
        Recommendation(name: "сrimea_082", photo: "recommendationImage"),
        Recommendation(name: "сrimea_082", photo: "recommendationImage"),
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
                image: "lavanda123",
                description: Description.description,
                timeNotified: .today,
                picture: "picture", isFollowing: false
            ),
            .init(
                name: "Arina",
                image: "lavanda123",
                description: Description.description,
                timeNotified: .today,
                picture: "picture", isFollowing: false
            ),
            .init(
                name: "Selena",
                image: "lavanda123",
                description: Description.description,
                timeNotified: .today,
                picture: "picture", isFollowing: false
            ),
            .init(
                name: "Selena",
                image: "lavanda123",
                description: Description.description,
                timeNotified: .today,
                picture: "", isFollowing: false
            ),
            .init(
                name: "Kadyr",
                image: "lavanda123",
                description: Description.description2,
                timeNotified: .thisWeek,
                picture: "", isFollowing: true
            ), .init(
                name: "Murka",
                image: "lavanda123",
                description: Description.description,
                timeNotified: .thisWeek,
                picture: "", isFollowing: true
            ),
            .init(
                name: "Lara",
                image: "lavanda123",
                description: Description.description,
                timeNotified: .thisWeek,
                picture: "picture", isFollowing: false
            ),
        ]
    }

    static func makeContactsWithGroup() -> [[Notification]] {
        let today = makeContacts().filter { $0.timeNotified == .today }
        let thisWeek = makeContacts().filter { $0.timeNotified == .thisWeek }
        return [today, thisWeek]
    }
}
