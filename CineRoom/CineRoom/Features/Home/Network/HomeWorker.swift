//
//  HomeWorker.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 25/03/21.
//

import Foundation
import Alamofire

class HomeWorker {
	
	// MARK: - Variable
	private let apiKey: String = "api_key=f0ca6496aecedd1cfc6487c0d9849760"
	private let urlBase: String = "https://api.themoviedb.org/3/"
	
	
	// Método para buscar os Filmes Tendencias
	func loadMovieTrending(completion: @escaping(_ success: MovieTrending?, _ error: NSError?) -> Void) {
		
		// URL API - Movie Trending
		let urlStrig: String = urlBase + "trending/movie/week?" + apiKey + "&language=pt-BR"
		guard let url: URL = URL(string: urlStrig) else { return completion(nil, nil) }
		
		// URL Request
		var urlRequest: URLRequest = URLRequest(url: url)
		
		// Configuração URLRequest
		urlRequest.httpMethod = "GET"
		urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
		
		// Chamada de Request para API
		AF.request(urlRequest).responseJSON { (response) in
			
			// Validação de retorno
			guard let data = response.data else { return completion(nil, nil) }
			
			do {
//				let movie: MovieTrending = try MovieTrending(data: data)
				let movie = try JSONDecoder().decode(MovieTrending.self, from: data)
				print("==> Sucesso na busca de Movie Trending")
				completion(movie, nil)
				
			} catch let error as NSError {
				print("==>> Erro na Request Movie Trending")
				print(error.localizedDescription)
				print(error.debugDescription)
				completion(nil, NSError())
			}
			
		}
		
	}
	
	
	// Método para buscar os Filmes Popular
	func loadMoviePopular(completion: @escaping(_ success: MoviePopular?, _ error: NSError?) -> Void) {
		
		// URL API - Movie Trending
		let urlStrig: String = urlBase + "movie/popular?" + apiKey + "&language=pt-BR&page=1"
		guard let url: URL = URL(string: urlStrig) else { return completion(nil, nil) }
		
		// URL Request
		var urlRequest: URLRequest = URLRequest(url: url)
		
		// Configuração URLRequest
		urlRequest.httpMethod = "GET"
		urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
		
		// Chamada de Request para API
		AF.request(urlRequest).responseJSON { (response) in
			
			// Validação de retorno
			guard let data = response.data else { return completion(nil, nil) }
			
			do {
//				let movie: MoviePopular = try MoviePopular(data: data)
				let movie = try JSONDecoder().decode(MoviePopular.self, from: data)
				print("==> Sucesso na busca de Movie Popular")
				completion(movie, nil)
				
			} catch let error as NSError {
				print("==>> Erro na Request Movie Popular")
				print(error.localizedDescription)
				print(error.debugDescription)
				completion(nil, NSError())
			}
			
		}
		
	}
	
	
	// Método para buscar os Files Assistir Agora
	func loadMovieNowPlaying(completion: @escaping(_ success: MovieNowPlaying?, _ error: NSError?) -> Void) {
		
		// URL API - Movie Trending
		let urlStrig: String = urlBase + "movie/now_playing?" + apiKey + "&language=pt-BR&page=1"
		guard let url: URL = URL(string: urlStrig) else { return completion(nil, nil) }
		
		// URL Request
		var urlRequest: URLRequest = URLRequest(url: url)
		
		// Configuração URLRequest
		urlRequest.httpMethod = "GET"
		urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
		
		// Chamada de Request para API
		AF.request(urlRequest).responseJSON { (response) in
			
			// Validação de retorno
			guard let data = response.data else { return completion(nil, nil) }
			
			do {
//				let movie: MovieNowPlaying = try MovieNowPlaying(data: data)
				let movie = try JSONDecoder().decode(MovieNowPlaying.self, from: data)
				print("==> Sucesso na busca de Movie Now Playing")
				completion(movie, nil)
				
			} catch let error as NSError {
				print("==>> Erro na Request Movie Now Playing")
				print(error.localizedDescription)
				print(error.debugDescription)
				completion(nil, NSError())
			}
			
		}
		
	}
	
}
