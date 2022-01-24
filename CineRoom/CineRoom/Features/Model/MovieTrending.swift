//
//  MovieTrending.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 11/03/21.
//

import Foundation

struct MovieTrending: Codable {
	 let page: Int
	 let results: [ResultTrending]
	 let totalPages: Int
    let totalResults: Int

	 enum CodingKeys: String, CodingKey {
		  case page, results
		  case totalPages = "total_pages"
		  case totalResults = "total_results"
	 }

}

struct ResultTrending: Codable {
	 let adult: Bool
	 let backdropPath: String?
	 let genreIDS: [Int]
	 let id: Int
	 let originalLanguage: String
	 let originalTitle: String
	 let overview: String
    let posterPath: String
	 let releaseDate, title: String
	 let video: Bool
	 let voteAverage: Double
	 let voteCount: Int
	 let popularity: Double
	 let mediaType: String

	 enum CodingKeys: String, CodingKey {
		  case adult
		  case backdropPath = "backdrop_path"
		  case genreIDS = "genre_ids"
		  case id
		  case originalLanguage = "original_language"
		  case originalTitle = "original_title"
		  case overview
		  case posterPath = "poster_path"
		  case releaseDate = "release_date"
		  case title, video
		  case voteAverage = "vote_average"
		  case voteCount = "vote_count"
		  case popularity
		  case mediaType = "media_type"
	 }

}
