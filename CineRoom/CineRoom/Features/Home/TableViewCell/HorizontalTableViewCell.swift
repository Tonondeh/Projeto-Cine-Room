//
//  HorizontalTableViewCell.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import UIKit

class HorizontalTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
	
	// MARK: - Variable
	static let identifier: String = "HorizontalTableViewCell"
	let controller: HomeController = HomeController()
	weak var delegate:CellDelegate?
	
	
	// MARK: - Lifecyle
	override func awakeFromNib() {
		super.awakeFromNib()
		self.getLoadMovies()
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	private func getLoadMovies() {
		// Busca filmes Popular
		self.controller.loadMoviePopular { (success, error) in
			if success {
				self.configCollectionView()
				self.collectionView.reloadData()
			}
		}
	}
	
	private func configCollectionView() {
		self.collectionView.delegate 			= self
		self.collectionView.dataSource 		= self
		self.collectionView.backgroundColor	= UIColor(named: "backgroundColor")
		self.collectionView.register(CartazHCollectionViewCell.nib(), forCellWithReuseIdentifier: CartazHCollectionViewCell.identifier)
	}
		
}


// MARK: - Extension CollectionView
extension HorizontalTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.controller.resultsMoviePopular
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cellH = collectionView.dequeueReusableCell(withReuseIdentifier: CartazHCollectionViewCell.identifier, for: indexPath) as? CartazHCollectionViewCell
		
		cellH?.configHCell(movie: self.controller.getMoviePopular(indexPath: indexPath))
		return cellH ?? UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 240, height: 155)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("Clicado em Celula Horizontal: \(indexPath.row)")
		let movieID = self.controller.getMoviePopular(indexPath: indexPath)
		
		self.delegate?.selectedCell(indexPath: indexPath, id: movieID?.id)
	}
	
}
