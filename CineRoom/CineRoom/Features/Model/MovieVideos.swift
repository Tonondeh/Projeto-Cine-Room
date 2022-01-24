//
//  MovieVideos.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 12/03/21.
//

import Foundation


// MARK: - MovieVideos
struct MovieVideos: Codable {
	 let id: Int
	 let results: [ResultVideos]
}

struct ResultVideos: Codable {
	 let id, iso639, iso3166, key: String
	 let name, site: String
	 let size: Int
	 let type: String

	 enum CodingKeys: String, CodingKey {
		  case id
		  case iso639 = "iso_639_1"
		  case iso3166 = "iso_3166_1"
		  case key, name, site, size, type
	 }

}
