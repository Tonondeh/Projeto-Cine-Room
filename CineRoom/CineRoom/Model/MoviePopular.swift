//
//  MoviePopular.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 11/03/21.
//

import Foundation


// MARK: - MoviePopular
class MoviePopular: Codable {
	 let page: Int
	 let results: [ResultPopular]
	 let totalPages, totalResults: Int

	 enum CodingKeys: String, CodingKey {
		  case page, results
		  case totalPages = "total_pages"
		  case totalResults = "total_results"
	 }

	 init(page: Int, results: [ResultPopular], totalPages: Int, totalResults: Int) {
		  self.page = page
		  self.results = results
		  self.totalPages = totalPages
		  self.totalResults = totalResults
	 }
}

// MARK: MoviePopular convenience initializers and mutators

extension MoviePopular {
	 convenience init(data: Data) throws {
		  let me = try newJSONDecoder().decode(MoviePopular.self, from: data)
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
		  results: [ResultPopular]? = nil,
		  totalPages: Int? = nil,
		  totalResults: Int? = nil
	 ) -> MoviePopular {
		  return MoviePopular(
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

// MARK: - ResultPopular
class ResultPopular: Codable {
	 let adult: Bool
	 let backdropPath: String?
	 let genreIDS: [Int]
	 let id: Int
	 let originalLanguage, originalTitle, overview: String
	 let popularity: Double
	 let posterPath, releaseDate, title: String
	 let video: Bool
	 let voteAverage: Double
	 let voteCount: Int

	 enum CodingKeys: String, CodingKey {
		  case adult
		  case backdropPath = "backdrop_path"
		  case genreIDS = "genre_ids"
		  case id
		  case originalLanguage = "original_language"
		  case originalTitle = "original_title"
		  case overview, popularity
		  case posterPath = "poster_path"
		  case releaseDate = "release_date"
		  case title, video
		  case voteAverage = "vote_average"
		  case voteCount = "vote_count"
	 }

	 init(adult: Bool, backdropPath: String?, genreIDS: [Int], id: Int, originalLanguage: String, originalTitle: String, overview: String, popularity: Double, posterPath: String, releaseDate: String, title: String, video: Bool, voteAverage: Double, voteCount: Int) {
		  self.adult = adult
		  self.backdropPath = backdropPath
		  self.genreIDS = genreIDS
		  self.id = id
		  self.originalLanguage = originalLanguage
		  self.originalTitle = originalTitle
		  self.overview = overview
		  self.popularity = popularity
		  self.posterPath = posterPath
		  self.releaseDate = releaseDate
		  self.title = title
		  self.video = video
		  self.voteAverage = voteAverage
		  self.voteCount = voteCount
	 }
}

// MARK: ResultPopular convenience initializers and mutators

extension ResultPopular {
	 convenience init(data: Data) throws {
		  let me = try newJSONDecoder().decode(ResultPopular.self, from: data)
		  self.init(adult: me.adult, backdropPath: me.backdropPath, genreIDS: me.genreIDS, id: me.id, originalLanguage: me.originalLanguage, originalTitle: me.originalTitle, overview: me.overview, popularity: me.popularity, posterPath: me.posterPath, releaseDate: me.releaseDate, title: me.title, video: me.video, voteAverage: me.voteAverage, voteCount: me.voteCount)
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
		  adult: Bool? = nil,
		  backdropPath: String? = nil,
		  genreIDS: [Int]? = nil,
		  id: Int? = nil,
		  originalLanguage: String? = nil,
		  originalTitle: String? = nil,
		  overview: String? = nil,
		  popularity: Double? = nil,
		  posterPath: String? = nil,
		  releaseDate: String? = nil,
		  title: String? = nil,
		  video: Bool? = nil,
		  voteAverage: Double? = nil,
		  voteCount: Int? = nil
	 ) -> ResultPopular {
		  return ResultPopular(
				adult: adult ?? self.adult,
				backdropPath: backdropPath ?? self.backdropPath,
				genreIDS: genreIDS ?? self.genreIDS,
				id: id ?? self.id,
				originalLanguage: originalLanguage ?? self.originalLanguage,
				originalTitle: originalTitle ?? self.originalTitle,
				overview: overview ?? self.overview,
				popularity: popularity ?? self.popularity,
				posterPath: posterPath ?? self.posterPath,
				releaseDate: releaseDate ?? self.releaseDate,
				title: title ?? self.title,
				video: video ?? self.video,
				voteAverage: voteAverage ?? self.voteAverage,
				voteCount: voteCount ?? self.voteCount
		  )
	 }

	 func jsonData() throws -> Data {
		  return try newJSONEncoder().encode(self)
	 }

	 func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		  return String(data: try self.jsonData(), encoding: encoding)
	 }
}
