//
//  AppInfo.swift
//  AppStorePractice
//
//  Created by Greed on 4/7/24.
//

import Foundation

struct SearchResult: Decodable {
    let results: [AppInfo]
}

struct AppInfo: Decodable {
    let icon: String // artworkUrl60
    let appName: String // trackName
    let screenshotUrls: [String]
    let averageUserRating: Double
    let releaseNotes: String
    let description: String
    let genres: [String]
    let sellerName: String
    let version: String
    
    enum CodingKeys: String, CodingKey {
        case icon = "artworkUrl60"
        case appName = "trackName"
        case screenshotUrls
        case averageUserRating
        case releaseNotes
        case description
        case genres
        case sellerName
        case version
    }
}
