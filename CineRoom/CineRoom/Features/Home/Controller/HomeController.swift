//
//  HomeController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 25/03/21.
//

import Foundation

class HomeController {
	
	// Movie Trending
	private var movieTrending: MovieTrending?
	
	var resultsMovieTrending: Int {
		return movieTrending?.results.count ?? 0
	}
	
	// Movie Popular
	private var moviePopular: MoviePopular?
	
	var resultsMoviePopular: Int {
		return moviePopular?.results.count ?? 0
	}
	
	// Movie Now Playing
	private var movieNowPlaying: MovieNowPlaying?
	
	var resultsMovieNowPlaying: Int {
		return movieNowPlaying?.results.count ?? 0
	}
	
	
	// Método Filmes Trending
	func loadMovieTrending(completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
		HomeWorker().loadMovieTrending { (trending, error) in
			if trending == nil {
				completion(false, error)
			} else {
				self.movieTrending = trending
				completion(true, nil)
			}
		}
	}
	
	// Método para retornar um Filme Trending
	func getMovieTrending(indexPath: IndexPath) -> ResultTrending? {
		return self.movieTrending?.results[indexPath.row] ?? nil
	}
	
	// Método Filmes Popular
	func loadMoviePopular(completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
		HomeWorker().loadMoviePopular { (popular, error) in
			if popular == nil {
				completion(false, error)
			} else {
				self.moviePopular = popular
				completion(true, nil)
			}
		}
	}
	
	// Método para retornar um Filme Popular
	func getMoviePopular(indexPath: IndexPath) -> ResultPopular? {
		return self.moviePopular?.results[indexPath.row] ?? nil
	}
	
	// Método Filmes Now Playing
	func loadMovieNowPlaying(completion: @escaping(_ success: Bool, _ error: NSError?) -> Void) {
		HomeWorker().loadMovieNowPlaying { (nowPlaying, error) in
			if nowPlaying == nil {
				completion(false, error)
			} else {
				self.movieNowPlaying = nowPlaying
				completion(true, nil)
			}
		}
	}
	
	// Método para retornar um Filme NowPlaying
	func getMovieNowPlaying(indexPath: IndexPath) -> ResultNowPlaying? {
		return self.movieNowPlaying?.results[indexPath.row] ?? nil
	}
    
    func loadUserData(email: String, completion: @escaping(_ success: UserData?) ->Void) {
        DataManager().loadUserData(email: email) { (success) in
            completion(success)
        }
        
    }
	
}
