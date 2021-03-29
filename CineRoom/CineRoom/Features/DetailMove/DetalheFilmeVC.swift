//
//  DetalheFilmeVC.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 26/02/21.
//

import UIKit

class DetalheFilmeVC: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var nomeFilmeLabel: UILabel!
	@IBOutlet weak var generoFilmeLabel: UILabel!
	@IBOutlet weak var ratingFilmeLabel: UILabel!
	@IBOutlet weak var overviewFilmeLabel: UILabel!
	@IBOutlet weak var duracaoFilmeLabel: UILabel!
	@IBOutlet weak var assistirFilmeButton: UIButton!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var bookmarkBarButtonItem: UIBarButtonItem!
	@IBOutlet weak var heartBarButtonItem: UIBarButtonItem!
	@IBOutlet weak var scrollView: UIScrollView!
	
	
	// MARK: - Variable
	var movieID: Int?
	let controller: DetalheController = DetalheController()
	
	
	// MARK: - Enum
	enum NameImage: String {
		case bookmark = "bookmark"
		case bookmarkFill = "bookmark.fill"
		case heart = "heart"
		case heartFill = "heart.fill"
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configScrollView()
		configBarButtonItem()
		configCollectionView()
		configTableView()
		loadMovieDetails()
	}
	
	
	
	// MARK: - Function
	private func configScrollView() {
		self.scrollView.delaysContentTouches = true
	}
	
	private func configBarButtonItem() {
		self.bookmarkBarButtonItem.tintColor = .black
		self.heartBarButtonItem.tintColor = .black
	}
	
	private func configCollectionView() {
		self.collectionView.backgroundColor = UIColor(named: "backgroundColor")
		self.collectionView.dataSource = self
		self.collectionView.delegate = self
		self.collectionView.register(ElencoCollectionViewCell.nib(), forCellWithReuseIdentifier: ElencoCollectionViewCell.identifier)
	}
	
	private func configTableView() {
		self.tableView.backgroundColor = UIColor(named: "backgroundColor")
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(TrailerFilmeTableViewCell.nib(), forCellReuseIdentifier: TrailerFilmeTableViewCell.identifier)
	}
	
	private func changeBookmarkBarButtonItem(_ button: UIBarButtonItem) {
		let imageBookmark = UIImage(systemName: NameImage.bookmark.rawValue)
		let imageBookmarkFill = UIImage(systemName: NameImage.bookmarkFill.rawValue)
		
		if button.image == imageBookmark {
			button.image = imageBookmarkFill
			button.tintColor = .orange
		} else {
			button.image = imageBookmark
			button.tintColor = .black
		}
	}
	
	private func changeHeartBarButtonItem(_ button: UIBarButtonItem) {
		let imageHeart = UIImage(systemName: NameImage.heart.rawValue)
		let imageHeartFill = UIImage(systemName: NameImage.heartFill.rawValue)
		
		if button.image == imageHeart {
			button.image = imageHeartFill
			button.tintColor = .red
		} else {
			button.image = imageHeart
			button.tintColor = .black
		}
		
	}
	
	private func loadMovieDetails() {
		
		if let id = self.movieID {
			
			self.controller.loadMovieDetail(movieId: id) { (success, error) in
				if success {
					if let detail = self.controller.getMovieDetail() {
						self.nomeFilmeLabel.text = detail.title
						self.generoFilmeLabel.text = self.controller.getGenres()
						self.ratingFilmeLabel.text = "\(detail.voteAverage)"
						self.overviewFilmeLabel.text = detail.overview
						self.duracaoFilmeLabel.text = self.controller.convertMinHour(value: detail.runtime)
						
						if detail.homepage == "" {
							self.assistirFilmeButton.isEnabled = false
						}
					}
					
				} else {
					print("Erro ao chamar o detalhe")
					self.dismiss(animated: true, completion: nil)
				}
			}
			
			self.controller.loadMovieCredit(movieId: id) { (success, error) in
				if success {
					print("Encontrou Credits")
					self.collectionView.reloadData()
				} else {
					print("Não encontrou Credits")
				}
			}
			
			self.controller.loadMovieVideo(movieId: id) { (success, error) in
				if success {
					print("Encontrou Videos")
					self.tableView.reloadData()
				} else {
					print("Não encontrou Videos")
				}
			}
			
		}
		
	}
	
	
	// MARK: - Action
	@IBAction func didTapBookmark(_ sender: UIBarButtonItem) {
		self.changeBookmarkBarButtonItem(sender)
	}
	
	@IBAction func didTapHeart(_ sender: UIBarButtonItem) {
		self.changeHeartBarButtonItem(sender)
	}
	
	
	@IBAction func didTapAssistir(_ sender: UIButton) {
		print(#function)
		print("Ir para Tela Assistir Agora!")
	}
	
	
	@IBAction func didTapCancelar(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}
	
}


// MARK: - Extension -> CollectionView
extension DetalheFilmeVC: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.controller.resultsMovieCredits
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElencoCollectionViewCell.identifier, for: indexPath) as? ElencoCollectionViewCell
		
		cell?.configCell(cast: self.controller.getMovieCredits(indexPath: indexPath))
		
		return cell ?? UICollectionViewCell()
	}
	
}



// MARK: - Extension -> TableView
extension DetalheFilmeVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.controller.resultsMovieVideos
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: TrailerFilmeTableViewCell.identifier, for: indexPath) as? TrailerFilmeTableViewCell
		
		cell?.configCell(video: self.controller.getMovieVideos(indexPath: indexPath))
		
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Celula selecionada - \(indexPath.row)")
	}

}
