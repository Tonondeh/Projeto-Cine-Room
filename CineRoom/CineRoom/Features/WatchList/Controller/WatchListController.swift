//
//  WatchListController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 30/03/21.
//

import Foundation

class WatchListController {
	
	// MARK: - Variable
	private var watchListDic: [String:Any]?
	private var watchListFavorite = [WatchModel]()
	private var watchListAssistir = [WatchModel]()

	
	// MARK: - Function
	
	// Método para adicionar Observer no Database
	func addObserveDatabase(completion: @escaping(_ success: Bool) -> Void) {
		DetalheWorker().addObserveDatabase { (success) in
			self.watchListFavorite.removeAll()
			self.watchListAssistir.removeAll()
			
			if success == nil {
				completion(false)
			} else {
				self.watchListDic = success
				self.configWathList()
				completion(true)
			}
		}
	}
	
	
	// Método para tratar o Watch List
	func configWathList() {
		print(#function)
		print("*******************************")
		guard let lista = self.watchListDic else { return }
		
		for value in lista {
			let movieId: Int? = Int(value.key)
			print("Chave: \(value.key)")
			
			if let watchItem = value.value as? Dictionary<String, String> {
				print("watchItem: \(watchItem)")
				let favorito = watchItem["favorite"] ?? ""
				let assistir = watchItem["watch"] ?? ""
				
				if favorito == "X" && assistir == "X" {
					// Dados Watch List Favorito
					self.watchListFavorite.append(WatchModel(movieId: movieId,
																			name: watchItem["name"],
																			genre: watchItem["genre"],
																			rating: watchItem["rating"],
																			foto: watchItem["foto"],
																			isFavorite: true,
																			isAssistir: true))
					// Dados Watch List Assistir
					self.watchListAssistir.append(WatchModel(movieId: movieId,
																			name: watchItem["name"],
																			genre: watchItem["genre"],
																			rating: watchItem["rating"],
																			foto: watchItem["foto"],
																			isFavorite: true,
																			isAssistir: true))
					
				} else if favorito == "X" {
					// Dados Watch List Favorito
					self.watchListFavorite.append(WatchModel(movieId: movieId,
																			name: watchItem["name"],
																			genre: watchItem["genre"],
																			rating: watchItem["rating"],
																			foto: watchItem["foto"],
																			isFavorite: true,
																			isAssistir: false))
					
				} else {
					self.watchListAssistir.append(WatchModel(movieId: movieId,
																			name: watchItem["name"],
																			genre: watchItem["genre"],
																			rating: watchItem["rating"],
																			foto: watchItem["foto"],
																			isFavorite: false,
																			isAssistir: true))
					
				}
				
			}
		}
	}
	
	
	// Método para retornar WatchItem
	func getWatchItem(selection: Int, indexPath: IndexPath) -> WatchModel? {
		if selection == 0 {
			return self.watchListFavorite[indexPath.row]
		} else {
			return self.watchListAssistir[indexPath.row]
		}
	}
	
	
	// Método para retornar count Favorite
	func countWathListFavorite() -> Int {
		if self.watchListFavorite.isEmpty {
			return 1
		} else {
			return self.watchListFavorite.count
		}
	}
	
	
	// Método para retornar count Assistir
	func countWathListAssistir() -> Int {
		if self.watchListAssistir.isEmpty {
			return 1
		} else {
			return self.watchListAssistir.count
		}
	}
	
	
	// Método para verificar se está vazio
	func checkEmptyWatchList(selection: Int) -> Bool {
		if selection == 0 {
			return self.watchListFavorite.isEmpty ? true : false
		} else {
			return self.watchListAssistir.isEmpty ? true : false
		}
	}
	
	
	// Método para Atualizar a Watch List
	func updateWatchList(item: WatchModel) {
		DetalheController().updateWatchList(item: item)
	}
	
	
}
