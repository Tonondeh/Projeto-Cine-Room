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
	var atores: [Elenco] = [ Elenco(nome: "Gal Gadot", nomeArt: "Diana Prince", imageElenco: #imageLiteral(resourceName: "ator4")),
									 Elenco(nome: "Ator 1", nomeArt: "Ator Art 1", imageElenco: UIImage(named: "ator1") ?? UIImage()),
									 Elenco(nome: "Ator 2", nomeArt: "Ator Art 2", imageElenco: UIImage(named: "ator2") ?? UIImage()),
									 Elenco(nome: "Ator 3", nomeArt: "Ator Art 3", imageElenco: UIImage(named: "ator3") ?? UIImage()),
									 Elenco(nome: "Ator 4", nomeArt: "Ator Art 4", imageElenco: UIImage(named: "ator4") ?? UIImage())
	]
	
	var traileres: [DetalheFilme] = [ DetalheFilme(nomeFilme: "Oficial trailler"),
												 DetalheFilme(nomeFilme: "Trailer Youtube"),
												 DetalheFilme(nomeFilme: "Mulher Maravilha 1984"),
												 DetalheFilme(nomeFilme: "Wonder Woman 1984 main trailer Subtitle")
	]
	
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
	}
	
	
	
	// MARK: - Function
	func configScrollView() {
		self.scrollView.delaysContentTouches = true
	}
	
	func configBarButtonItem() {
		self.bookmarkBarButtonItem.tintColor = .black
		self.heartBarButtonItem.tintColor = .black
	}
	
	func configCollectionView() {
		self.collectionView.backgroundColor = UIColor(named: "backgroundColor")
		self.collectionView.dataSource = self
		self.collectionView.delegate = self
		self.collectionView.register(ElencoCollectionViewCell.nib(), forCellWithReuseIdentifier: ElencoCollectionViewCell.identifier)
	}
	
	func configTableView() {
		self.tableView.backgroundColor = UIColor(named: "backgroundColor")
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(TrailerFilmeTableViewCell.nib(), forCellReuseIdentifier: TrailerFilmeTableViewCell.identifier)
	}
	
	func changeBookmarkBarButtonItem(_ button: UIBarButtonItem) {
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
	
	func changeHeartBarButtonItem(_ button: UIBarButtonItem) {
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
	
	
}



// MARK: - Extension -> CollectionView
extension DetalheFilmeVC: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return atores.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let ator = atores[indexPath.row]
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElencoCollectionViewCell.identifier, for: indexPath) as? ElencoCollectionViewCell
		
		cell?.configCell(elenco: ator)
		
		return cell ?? UICollectionViewCell()
	}
	
	
}



// MARK: - Extension -> TableView
extension DetalheFilmeVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return traileres.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let trailer = traileres[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: TrailerFilmeTableViewCell.identifier, for: indexPath) as? TrailerFilmeTableViewCell
		
		cell?.configCell(detalhe: trailer)
		
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Celula selecionada - \(indexPath.row)")
	}
	
	
}
