//
//  HomeWorker.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 25/03/21.
//

import Foundation

class HomeWorker {
	
	// MARK: - Variable
	
	//Link: https://api.themoviedb.org/3/trending/movie/week?api_key=f0ca6496aecedd1cfc6487c0d9849760
	
	private let apiKey: String = "api_key=f0ca6496aecedd1cfc6487c0d9849760"
	private let urlBase: String = "https://api.themoviedb.org/3/"
	
	
	// Método para buscar os Filmes Tendencias
	func loadMovieTrending(completion: @escaping(_ success: MovieTrending?, _ error: NSError?) -> Void) {
		
		// URL API - Movie Trending
		let urlStrig: String = urlBase + "trending/movie/week?" + apiKey
		guard let url: URL = URL(string: urlStrig) else { return completion(nil, nil) }
		
		// URL Request
		var urlRequest: URLRequest = URLRequest(url: url)
		
		// Configuração URLRequest
		urlRequest.httpMethod = "GET"
		urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
		
		// Chamada de Request para API
		
		
		
	}
	
	
	// Método para buscar os Filmes Popular
	
	
	// Método para buscar os Files Assistir Agora
	
	
	
	
}
