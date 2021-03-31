//
//  HomeViewController.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import Foundation
import UIKit


// MARK: - Enum - CategoryMovie
enum CategoryMovie: String {
	case Trending = "Tendências"
	case Poupular = "Popular"
	case NowPlaying = "Assistir agora"
}

class HomeViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var nameUserLabel: UILabel!
	
	// MARK: - Variable
	var controller: HomeController = HomeController()
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configTableView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.configNameUser()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "SegueDetalheStoryBoard" {
			guard let detNavigation = segue.destination as? UINavigationController,
					let detVC = detNavigation.topViewController as? DetalheFilmeVC
			else { return }
			
			detVC.movieID = sender as? Int

		}
	}
	
	
	// MARK: - Function
	private func configTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		self.tableView.register(VerticalTableViewCell.nib(), forCellReuseIdentifier: VerticalTableViewCell.identifier)
		self.tableView.register(HorizontalTableViewCell.nib(), forCellReuseIdentifier: HorizontalTableViewCell.identifier)
	}
	
	private func configNameUser() {
		guard let email = Utils.getUserDefaults(key: "email") as? String
		else {return self.nameUserLabel.text = "Olá 😍" }
		
		self.controller.loadUserData(email: email) { (success) in
			if let user = success {
                self.nameUserLabel.text = "Olá, \(user.nameDisplay) !"
			} else {
				self.nameUserLabel.text = "Olá 😍"
			}
		}
		
	}
	
}


// MARK: - Extension TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch indexPath.row {
			// Movie Trending [Cell Vertical]
			case 0:
				let cellV = tableView.dequeueReusableCell(withIdentifier: VerticalTableViewCell.identifier, for: indexPath) as? VerticalTableViewCell
				cellV?.setCategoryMovie(category: .Trending, delegate: self)
				return cellV ?? UITableViewCell()
				
			// Movie Popular [Cell Horizontal]
			case 1:
				let cellH = tableView.dequeueReusableCell(withIdentifier: HorizontalTableViewCell.identifier, for: indexPath) as? HorizontalTableViewCell
				cellH?.setupTitle(title: .Poupular, delegate: self)
				
				return cellH ?? UITableViewCell()
				
			// Movie Now Playing [Cell Vertical]
			case 2:
				let cellV = tableView.dequeueReusableCell(withIdentifier: VerticalTableViewCell.identifier, for: indexPath) as? VerticalTableViewCell
				cellV?.setCategoryMovie(category: .NowPlaying, delegate: self)
				return cellV ?? UITableViewCell()
				
			default:
				return UITableViewCell()
		}
		
	}
}


// MARK: - Extension CellDelegate
extension HomeViewController: CellDelegate {
	
	func selectedCell(indexPath: IndexPath, id: Int?) {
		performSegue(withIdentifier: "SegueDetalheStoryBoard", sender: id)
		print("Clicado em Section: \(indexPath.section) - Celula: \(indexPath.row)")
	}
	
}

