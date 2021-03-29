//
//  MovieTrending.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 11/03/21.
//

import Foundation


// MARK: - MovieTrending
class MovieTrending: Codable {
	 let page: Int
	 let results: [ResultTrending]
	 let totalPages, totalResults: Int

	 enum CodingKeys: String, CodingKey {
		  case page, results
		  case totalPages = "total_pages"
		  case totalResults = "total_results"
	 }

	 init(page: Int, results: [ResultTrending], totalPages: Int, totalResults: Int) {
		  self.page = page
		  self.results = results
		  self.totalPages = totalPages
		  self.totalResults = totalResults
	 }
}

// MARK: MovieTrending convenience initializers and mutators

extension MovieTrending {
	 convenience init(data: Data) throws {
		  let me = try newJSONDecoder().decode(MovieTrending.self, from: data)
		  self.init(page: me.page, results: me.results, totalPages: me.totalPages, totalResults: me.totalResults)
	 }

	 convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
		  guard let data = json.data(using: encoding) else {
				throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
		  }
		  try self.init(data: data)
	 }

	 convenience init(fromURL url: URL) throws {
		  try self.init(data: try Data(contentsOf: url))
	 }

	 func with(
		  page: Int? = nil,
		  results: [ResultTrending]? = nil,
		  totalPages: Int? = nil,
		  totalResults: Int? = nil
	 ) -> MovieTrending {
		  return MovieTrending(
				page: page ?? self.page,
				results: results ?? self.results,
				totalPages: totalPages ?? self.totalPages,
				totalResults: totalResults ?? self.totalResults
		  )
	 }

	 func jsonData() throws -> Data {
		  return try newJSONEncoder().encode(self)
	 }

	 func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		  return String(data: try self.jsonData(), encoding: encoding)
	 }
}

// MARK: - ResultTrending
class ResultTrending: Codable {
	 let adult: Bool
	 let backdropPath: String
	 let genreIDS: [Int]
	 let id: Int
	 let originalLanguage, originalTitle, overview, posterPath: String
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

	 init(adult: Bool, backdropPath: String, genreIDS: [Int], id: Int, originalLanguage: String, originalTitle: String, overview: String, posterPath: String, releaseDate: String, title: String, video: Bool, voteAverage: Double, voteCount: Int, popularity: Double, mediaType: String) {
		  self.adult = adult
		  self.backdropPath = backdropPath
		  self.genreIDS = genreIDS
		  self.id = id
		  self.originalLanguage = originalLanguage
		  self.originalTitle = originalTitle
		  self.overview = overview
		  self.posterPath = posterPath
		  self.releaseDate = releaseDate
		  self.title = title
		  self.video = video
		  self.voteAverage = voteAverage
		  self.voteCount = voteCount
		  self.popularity = popularity
		  self.mediaType = mediaType
	 }
}

// MARK: ResultTrending convenience initializers and mutators

extension ResultTrending {
	 convenience init(data: Data) throws {
		  let me = try newJSONDecoder().decode(ResultTrending.self, from: data)
		  self.init(adult: me.adult, backdropPath: me.backdropPath, genreIDS: me.genreIDS, id: me.id, originalLanguage: me.originalLanguage, originalTitle: me.originalTitle, overview: me.overview, posterPath: me.posterPath, releaseDate: me.releaseDate, title: me.title, video: me.video, voteAverage: me.voteAverage, voteCount: me.voteCount, popularity: me.popularity, mediaType: me.mediaType)
	 }

	 convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
		  guard let data = json.data(using: encoding) else {
				throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
		  }
		  try self.init(data: data)
	 }

	 convenience init(fromURL url: URL) throws {
		  try self.init(data: try Data(contentsOf: url))
	 }

	 func with(adult: Bool? = nil, backdropPath: String? = nil, genreIDS: [Int]? = nil, id: Int? = nil,
		  originalLanguage: String? = nil,
		  originalTitle: String? = nil,
		  overview: String? = nil,
		  posterPath: String? = nil,
		  releaseDate: String? = nil,
		  title: String? = nil,
		  video: Bool? = nil,
		  voteAverage: Double? = nil,
		  voteCount: Int? = nil,
		  popularity: Double? = nil,
		  mediaType: String? = nil
	 ) -> ResultTrending {
		  return ResultTrending(
				adult: adult ?? self.adult,
				backdropPath: backdropPath ?? self.backdropPath,
				genreIDS: genreIDS ?? self.genreIDS,
				id: id ?? self.id,
				originalLanguage: originalLanguage ?? self.originalLanguage,
				originalTitle: originalTitle ?? self.originalTitle,
				overview: overview ?? self.overview,
				posterPath: posterPath ?? self.posterPath,
				releaseDate: releaseDate ?? self.releaseDate,
				title: title ?? self.title,
				video: video ?? self.video,
				voteAverage: voteAverage ?? self.voteAverage,
				voteCount: voteCount ?? self.voteCount,
				popularity: popularity ?? self.popularity,
				mediaType: mediaType ?? self.mediaType
		  )
	 }

	 func jsonData() throws -> Data {
		  return try newJSONEncoder().encode(self)
	 }

	 func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		  return String(data: try self.jsonData(), encoding: encoding)
	 }
}
