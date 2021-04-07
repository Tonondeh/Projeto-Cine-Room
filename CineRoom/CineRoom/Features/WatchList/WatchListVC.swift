//
//  WatchListVC.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 26/02/21.
//

import UIKit

class WatchListVC: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var listSegmented: UISegmentedControl!
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: - Variable
	private let controller: WatchListController = WatchListController()
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
				
		self.tabBarController?.tabBar.isHidden = true
		self.showSpinner()
		self.configObserver()
	}
	
	
	// MARK: - Function
	private func configObserver() {
		self.controller.addObserveDatabase { ( _ ) in
			self.configTableView()
			self.removeSpinner()
			self.tabBarController?.tabBar.isHidden = false
		}
	}
	
	private func configTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.backgroundColor = UIColor(named: "backgroudColor")
		self.tableView.register(WatchListTableViewCell.nib(), forCellReuseIdentifier: WatchListTableViewCell.identifier)
		self.tableView.register(WatchListEmptyCell.nib(), forCellReuseIdentifier: WatchListEmptyCell.identifier)
		self.tableView.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "segueDetalheStoryboard" {
			if let navVC = segue.destination as? UINavigationController,
				let detalheVC = navVC.topViewController as? DetalheFilmeVC,
				let item = sender as? WatchModel {
				detalheVC.movieID = item.movieId
				detalheVC.favorito = item.isFavorite
				detalheVC.queroAssistir = item.isAssistir
				detalheVC.backdrop = item.foto
			}
		}
	}
	
	
	// MARK: - Action
	@IBAction func didTapList(_ sender: UISegmentedControl) {
		self.tableView.reloadData()
	}
	
}


// MARK: - Extension -> TableView
extension WatchListVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if self.listSegmented.selectedSegmentIndex == 0 {
			return self.controller.countWathListFavorite()
		} else {
			return self.controller.countWathListAssistir()
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let watchListSelection = self.listSegmented.selectedSegmentIndex
		
		if self.controller.checkEmptyWatchList(selection: watchListSelection) {
			let cell = tableView.dequeueReusableCell(withIdentifier: WatchListEmptyCell.identifier, for: indexPath) as? WatchListEmptyCell
			return cell ?? UITableViewCell()
			
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: WatchListTableViewCell.identifier, for: indexPath) as? WatchListTableViewCell
			cell?.configCell(filme: self.controller.getWatchItem(selection: self.listSegmented.selectedSegmentIndex,
																				  indexPath: indexPath))
			return cell ?? UITableViewCell()
			
		}
		
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("UISegmented atual: \(self.listSegmented.selectedSegmentIndex)")
		print("Selecionado Indice: \(indexPath.row)")
		let item = self.controller.getWatchItem(selection: self.listSegmented.selectedSegmentIndex, indexPath: indexPath)
		
		self.performSegue(withIdentifier: "segueDetalheStoryboard", sender: item)
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		if editingStyle == .delete {
			print("Swipe para deletar")
			
			let alertController = UIAlertController(title: "Você tem certeza?", message: "Deseja realmente tirar esse filme da sua lista?", preferredStyle: .alert)
			let buttonOK = UIAlertAction(title: "OK", style: .default) { (alert) in
				print("Clicou em deletar filme")
				
				var movie = self.controller.getWatchItem(selection: self.listSegmented.selectedSegmentIndex,
																	  indexPath: indexPath)
				
				if self.listSegmented.selectedSegmentIndex == 0 {
					movie?.isFavorite = false
				} else {
					movie?.isAssistir = false
				}
				
				if let _movie = movie {
					self.controller.updateWatchList(item: _movie)
				}
				
				tableView.reloadData()
			}
			let buttonCancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
			
			alertController.addAction(buttonOK)
			alertController.addAction(buttonCancel)
			
			self.present(alertController, animated: true, completion: nil)
		}
		
	}
	
}
