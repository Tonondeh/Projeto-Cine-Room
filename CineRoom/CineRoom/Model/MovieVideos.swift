//
//  MovieVideos.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 12/03/21.
//

import Foundation


// MARK: - MovieVideos
class MovieVideos: Codable {
	 let id: Int
	 let results: [ResultVideos]

	 init(id: Int, results: [ResultVideos]) {
		  self.id = id
		  self.results = results
	 }
}

// MARK: MovieVideos convenience initializers and mutators

extension MovieVideos {
	 convenience init(data: Data) throws {
		  let me = try newJSONDecoder().decode(MovieVideos.self, from: data)
		  self.init(id: me.id, results: me.results)
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
		  id: Int? = nil,
		  results: [ResultVideos]? = nil
	 ) -> MovieVideos {
		  return MovieVideos(
				id: id ?? self.id,
				results: results ?? self.results
		  )
	 }

	 func jsonData() throws -> Data {
		  return try newJSONEncoder().encode(self)
	 }

	 func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		  return String(data: try self.jsonData(), encoding: encoding)
	 }
}

// MARK: - ResultVideos
class ResultVideos: Codable {
	 let id, iso639_1, iso3166_1, key: String
	 let name, site: String
	 let size: Int
	 let type: String

	 enum CodingKeys: String, CodingKey {
		  case id
		  case iso639_1 = "iso_639_1"
		  case iso3166_1 = "iso_3166_1"
		  case key, name, site, size, type
	 }

	 init(id: String, iso639_1: String, iso3166_1: String, key: String, name: String, site: String, size: Int, type: String) {
		  self.id = id
		  self.iso639_1 = iso639_1
		  self.iso3166_1 = iso3166_1
		  self.key = key
		  self.name = name
		  self.site = site
		  self.size = size
		  self.type = type
	 }
}

// MARK: ResultVideos convenience initializers and mutators

extension ResultVideos {
	 convenience init(data: Data) throws {
		  let me = try newJSONDecoder().decode(ResultVideos.self, from: data)
		  self.init(id: me.id, iso639_1: me.iso639_1, iso3166_1: me.iso3166_1, key: me.key, name: me.name, site: me.site, size: me.size, type: me.type)
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
		  id: String? = nil,
		  iso639_1: String? = nil,
		  iso3166_1: String? = nil,
		  key: String? = nil,
		  name: String? = nil,
		  site: String? = nil,
		  size: Int? = nil,
		  type: String? = nil
	 ) -> ResultVideos {
		  return ResultVideos(
				id: id ?? self.id,
				iso639_1: iso639_1 ?? self.iso639_1,
				iso3166_1: iso3166_1 ?? self.iso3166_1,
				key: key ?? self.key,
				name: name ?? self.name,
				site: site ?? self.site,
				size: size ?? self.size,
				type: type ?? self.type
		  )
	 }

	 func jsonData() throws -> Data {
		  return try newJSONEncoder().encode(self)
	 }

	 func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		  return String(data: try self.jsonData(), encoding: encoding)
	 }
}


