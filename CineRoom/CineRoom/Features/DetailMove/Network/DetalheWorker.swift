//
//  DetalheWorker.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 28/03/21.
//

import Foundation
import Alamofire
import Firebase

class DetalheWorker {
	
	// MARK: - Variable
	private let apiKey: String = "api_key=f0ca6496aecedd1cfc6487c0d9849760"
	private let urlBase: String = "https://api.themoviedb.org/3/movie/"
	private let autenticacao = Auth.auth()

		
	// Método para buscar Detalhe do Filme
	func loadMovieDetail(movieId: Int, completion: @escaping(_ success: MovieDetail?, _ error: NSError?) -> Void) {
		
		// URL API
		let urlStrig: String = urlBase + "\(movieId)?" + apiKey + "&language=pt-BR"
		guard let url: URL = URL(string: urlStrig) else { return completion(nil, nil) }
		
		print("URL-Detail: \(urlStrig)")
		
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
				let movie: MovieDetail = try MovieDetail(data: data)
				print("==> Sucesso na busca de MovieDetail")
				completion(movie, nil)
				
			} catch let error as NSError {
				print("==>> Erro na Request Movie Detail")
				print(error.localizedDescription)
				completion(nil, NSError())
			}
			
		}
		
	}
	
	
	// Método para buscar Creditos do Filme
	func loadMovieCredit(movieId: Int, completion: @escaping(_ success: MovieCredits?, _ error: NSError?) -> Void) {
		
		// URL API
		let urlStrig: String = urlBase + "\(movieId)/credits?" + apiKey + "&language=pt-BR"
		guard let url: URL = URL(string: urlStrig) else { return completion(nil, nil) }
		
		print("URL-Credit: \(urlStrig)")
		
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
				let credits: MovieCredits = try MovieCredits(data: data)
				print("==> Sucesso na busca de Movie Credit")
				completion(credits, nil)
				
			} catch let error as NSError{
				print("==>> Erro na Request Movie Credit")
				print(error.localizedDescription)
				completion(nil, NSError())
			}
			
		}
		
	}
	
	
	// Método para buscar Videos do Filme
	func loadMovieVideo(movieId: Int, completion: @escaping(_ success: MovieVideos?, _ error: NSError?) -> Void) {
		
		// URL API
		let urlStrig: String = urlBase + "\(movieId)/videos?" + apiKey + "&language=en-US"
		guard let url: URL = URL(string: urlStrig) else { return completion(nil, nil) }
		
		print("URL-Videos: \(urlStrig)")
		
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
				let videos: MovieVideos = try MovieVideos(data: data)
				print("==> Sucesso na busca de Movie Videos")
				completion(videos, nil)
				
			} catch {
				print("==>> Erro na Request Movie Videos")
				print(error.localizedDescription)
				completion(nil, NSError())
			}
			
		}
		
	}
	
	
	// Método para gravar filme na WatchList
	func setWatchList(movieID: Int?, name: String?, genre: String?, rating: String?, foto: String?, favorite: String?, watch: String?) {
		
	}
		
}
