//
//  MovieCredits.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 12/03/21.
//

import Foundation

struct MovieCredits: Codable {
	let id: Int
	let cast: [Cast]
	let crew: [Crew]
}

struct Cast: Codable {
	let adult: Bool
	let gender, id: Int
	let knownForDepartment, name, originalName: String
	let popularity: Double
	let profilePath: String?
	let castID: Int
	let character, creditID: String
	let order: Int

	enum CodingKeys: String, CodingKey {
		case adult, gender, id
		case knownForDepartment = "known_for_department"
		case name
		case originalName = "original_name"
		case popularity
		case profilePath = "profile_path"
		case castID = "cast_id"
		case character
		case creditID = "credit_id"
		case order
	}

}

struct Crew: Codable {
	let adult: Bool
	let gender, id: Int
	let knownForDepartment, name, originalName: String
	let popularity: Double
	let profilePath: String?
	let creditID, department, job: String

	enum CodingKeys: String, CodingKey {
		case adult, gender, id
		case knownForDepartment = "known_for_department"
		case name
		case originalName = "original_name"
		case popularity
		case profilePath = "profile_path"
		case creditID = "credit_id"
		case department, job
	}

}
