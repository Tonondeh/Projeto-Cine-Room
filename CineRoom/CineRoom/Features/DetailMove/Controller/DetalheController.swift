//
//  DetalheController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 28/03/21.
//

import Foundation

class DetalheController {
	
	private var movieDetail: MovieDetail?
	private var movieCredit: MovieCredits?
	private var movieVideo: MovieVideos?
	
	var resultsMovieVideos: Int {
		return movieVideo?.results.count ?? 0
	}
	
	var resultsMovieCredits: Int {
		return movieCredit?.cast.count ?? 0
	}
	
	
	// MARK: - Function
	
	/*
		Tratativa para Movie Detail
	*/

	// Método Detail API
	func loadMovieDetail(movieId: Int, completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
		DetalheWorker().loadMovieDetail(movieId: movieId) { (detail, error) in
			if detail == nil {
				completion(false, error)
			} else {
				self.movieDetail = detail
				completion(true, nil)
			}
		}
	}
	
	
	// Método para retornar Detail
	func getMovieDetail() -> MovieDetail? {
		return self.movieDetail ?? nil
	}
	
	
	// Método para retornar os Generos
	func getGenres() -> String? {
		guard let genres = self.movieDetail?.genres else { return nil }
		var genre: String = ""
		
		for detGenre in genres {
			if genre == "" {
				genre = detGenre.name
			} else {
				genre = genre + ", " + detGenre.name
			}
		}
		return genre
	}
	
	
	// Método para converter minuto em Hora
	func convertMinHour(value: Int) -> String {
		let hour: Int = value / 60
		let min: Int = value - (hour * 60)
		return "\(hour)h \(min)m"
	}
	
	
	/*
		Tratativa para Movie Credit
	*/
	
	// Método Credit API
	func loadMovieCredit(movieId: Int, completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
		DetalheWorker().loadMovieCredit(movieId: movieId) { (credit, error) in
			if credit == nil {
				completion(false, error)
			} else {
				self.movieCredit = credit
				completion(true, nil)
			}
		}
	}
	
	
	// Método para retornar Cast
	func getMovieCredits(indexPath: IndexPath) -> Cast? {
		return self.movieCredit?.cast[indexPath.row]
	}
	
	
	/*
		Tratativa para Movie Video
	*/
	
	// Método Video API
	func loadMovieVideo(movieId: Int, completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
		DetalheWorker().loadMovieVideo(movieId: movieId) { (video, error) in
			if video == nil {
				completion(false, error)
			} else {
				self.movieVideo = video
				completion(true, nil)
			}
		}
	}
	
	
	// Método para retornar Video
	func getMovieVideos(indexPath: IndexPath) -> ResultVideos? {
		return self.movieVideo?.results[indexPath.row]
	}
	
	

	
	

	
}