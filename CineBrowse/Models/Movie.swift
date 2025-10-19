//
//  Movie.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 18/10/25.
//

import Foundation


struct Movie: Codable, Identifiable, Equatable, Hashable {
    let id: String
    let movieID: Int
    let originalTitle, originalLanguage, overview: String
    let popularity: Double
    let posterPath, backdropPath: String
    let releaseDate: String?
    let voteAverage: Double
    let voteCount, adult: Int
    let casts: [Cast]

    enum CodingKeys: String, CodingKey {
        case id
        case movieID = "movie_id"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case overview, popularity
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case adult
        case casts
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.movieID == rhs.movieID
    }
    
    static let `default` = Movie(id: "b004fec0-e170-4683-91f1-23960266a645", movieID: 50820, originalTitle: "The Substitute 3: Winner Takes All", originalLanguage: "en", overview: "At a college visit to a war buddy\'s professor daughter, mercenary Treat Williams finds her brutally beaten. He then poses as a teacher to teach a lesson to the football jocks responsible.", popularity: 9.37, posterPath: "https://image.tmdb.org/t/p/original/zQ7rVfLbl72ZGoj3MGszLtMmNL7.jpg", backdropPath: "https://image.tmdb.org/t/p/original/rnpzVN4zQQOfLxtkoQ2jjGLXTyP.jpg", releaseDate: "Sat, 08/14/1999", voteAverage: 5.2, voteCount: 34, adult: 0, casts: [.default, .default, .default])
}

// MARK: - Cast
struct Cast: Codable, Hashable, Identifiable {
    let id: String
    let movieID: Int
    let name, originalName, popularity: String
    let profilePath: String
    let character: String

    enum CodingKeys: String, CodingKey {
        case id
        case movieID = "movie_id"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case character
    }
    
    static let `default` = Cast(id: UUID().uuidString, movieID: 50820, name: "Jean Marsh", originalName: "Jean Marsh", popularity: "9.449", profilePath: "https://image.tmdb.org/t/p/original/x4ZPhTWCn0BTLiTz2YnXUSRJJxT.jpg", character: "Queen Bavmorda")
}
