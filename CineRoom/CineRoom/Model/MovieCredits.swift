//
//  MovieCredits.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 12/03/21.
//

import Foundation

// MARK: - MovieCredits
class MovieCredits: Codable {
	let id: Int
	let cast: [Cast]
	let crew: [Crew]
	
	init(id: Int, cast: [Cast], crew: [Crew]) {
		self.id = id
		self.cast = cast
		self.crew = crew
	}
}

// MARK: MovieCredits convenience initializers and mutators

extension MovieCredits {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(MovieCredits.self, from: data)
		self.init(id: me.id, cast: me.cast, crew: me.crew)
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
		cast: [Cast]? = nil,
		crew: [Crew]? = nil
	) -> MovieCredits {
		return MovieCredits(
			id: id ?? self.id,
			cast: cast ?? self.cast,
			crew: crew ?? self.crew
		)
	}
	
	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}
	
	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

// MARK: - Cast
class Cast: Codable {
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
	
	init(adult: Bool, gender: Int, id: Int, knownForDepartment: String, name: String, originalName: String, popularity: Double, profilePath: String?, castID: Int, character: String, creditID: String, order: Int) {
		self.adult = adult
		self.gender = gender
		self.id = id
		self.knownForDepartment = knownForDepartment
		self.name = name
		self.originalName = originalName
		self.popularity = popularity
		self.profilePath = profilePath
		self.castID = castID
		self.character = character
		self.creditID = creditID
		self.order = order
	}
}

// MARK: Cast convenience initializers and mutators

extension Cast {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(Cast.self, from: data)
		self.init(adult: me.adult, gender: me.gender, id: me.id, knownForDepartment: me.knownForDepartment, name: me.name, originalName: me.originalName, popularity: me.popularity, profilePath: me.profilePath, castID: me.castID, character: me.character, creditID: me.creditID, order: me.order)
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
		gender: Int? = nil,
		id: Int? = nil,
		knownForDepartment: String? = nil,
		name: String? = nil,
		originalName: String? = nil,
		popularity: Double? = nil,
		profilePath: String? = nil,
		castID: Int? = nil,
		character: String? = nil,
		creditID: String? = nil,
		order: Int? = nil
	) -> Cast {
		return Cast(
			adult: adult ?? self.adult,
			gender: gender ?? self.gender,
			id: id ?? self.id,
			knownForDepartment: knownForDepartment ?? self.knownForDepartment,
			name: name ?? self.name,
			originalName: originalName ?? self.originalName,
			popularity: popularity ?? self.popularity,
			profilePath: profilePath ?? self.profilePath,
			castID: castID ?? self.castID,
			character: character ?? self.character,
			creditID: creditID ?? self.creditID,
			order: order ?? self.order
		)
	}
	
	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}
	
	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}

// MARK: - Crew
class Crew: Codable {
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
	
	init(adult: Bool, gender: Int, id: Int, knownForDepartment: String, name: String, originalName: String, popularity: Double, profilePath: String?, creditID: String, department: String, job: String) {
		self.adult = adult
		self.gender = gender
		self.id = id
		self.knownForDepartment = knownForDepartment
		self.name = name
		self.originalName = originalName
		self.popularity = popularity
		self.profilePath = profilePath
		self.creditID = creditID
		self.department = department
		self.job = job
	}
}

// MARK: Crew convenience initializers and mutators

extension Crew {
	convenience init(data: Data) throws {
		let me = try newJSONDecoder().decode(Crew.self, from: data)
		self.init(adult: me.adult, gender: me.gender, id: me.id, knownForDepartment: me.knownForDepartment, name: me.name, originalName: me.originalName, popularity: me.popularity, profilePath: me.profilePath, creditID: me.creditID, department: me.department, job: me.job)
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
		gender: Int? = nil,
		id: Int? = nil,
		knownForDepartment: String? = nil,
		name: String? = nil,
		originalName: String? = nil,
		popularity: Double? = nil,
		profilePath: String? = nil,
		creditID: String? = nil,
		department: String? = nil,
		job: String? = nil
	) -> Crew {
		return Crew(
			adult: adult ?? self.adult,
			gender: gender ?? self.gender,
			id: id ?? self.id,
			knownForDepartment: knownForDepartment ?? self.knownForDepartment,
			name: name ?? self.name,
			originalName: originalName ?? self.originalName,
			popularity: popularity ?? self.popularity,
			profilePath: profilePath ?? self.profilePath,
			creditID: creditID ?? self.creditID,
			department: department ?? self.department,
			job: job ?? self.job
		)
	}
	
	func jsonData() throws -> Data {
		return try newJSONEncoder().encode(self)
	}
	
	func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
		return String(data: try self.jsonData(), encoding: encoding)
	}
}
