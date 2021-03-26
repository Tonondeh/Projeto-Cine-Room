//
//  VerticalTableViewCell.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import UIKit


class VerticalTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
	
	// MARK: - Variable
	static let identifier: String = "VerticalTableViewCell"
	let controller: HomeController = HomeController()
	private var category: CategoryMovie?
	
	weak var delegate:CellDelegate?
	
	
	// MARK: - Lifecycle
	override func awakeFromNib() {
		super.awakeFromNib()
		self.configCollectionView()
	}
	
	
	// MARK: - Function
	static func nib () -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	private func configCollectionView() {
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.backgroundColor = UIColor(named: "backgroundColor")
		self.collectionView.register(CartazVCollectionViewCell.nib(), forCellWithReuseIdentifier: CartazVCollectionViewCell.identifier)
	}
	

	func setCategoryMovie(category: CategoryMovie, delegate: CellDelegate) {
		self.delegate = delegate
		if category == .Trending {
			self.getLoadTreding()
		} else if category == .NowPlaying {
			self.getLoadNowPlaying()
		}
		self.category = category
	}
	
	private func getLoadTreding() {
		self.controller.loadMovieTrending { (success, error) in
			if success {
				self.collectionView.reloadData()
			}
		}
	}
	
	private func getLoadNowPlaying() {
		self.controller.loadMovieNowPlaying { (success, error) in
			self.collectionView.reloadData()
		}
	}
	
}


// MARK: - Extension CollectionView
extension VerticalTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch self.category {
			case .Trending:
				return self.controller.resultsMovieTrending
			case .NowPlaying:
				return self.controller.resultsMovieNowPlaying
			default:
				return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cellV = collectionView.dequeueReusableCell(withReuseIdentifier: CartazVCollectionViewCell.identifier, for: indexPath) as? CartazVCollectionViewCell
		
		switch self.category {
			case .Trending:
				cellV?.configCellTrending(movie: self.controller.getMovieTrending(indexPath: indexPath))
			case .NowPlaying:
				cellV?.configCellNowPlaying(movie: self.controller.getMovieNowPlaying(indexPath: indexPath))
			default:
				break
		}
		return cellV ?? UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("Clicado em Celula Vertical: \(indexPath.row)")
		self.delegate?.selectedCell(indexPath: indexPath)
	}
	
}
