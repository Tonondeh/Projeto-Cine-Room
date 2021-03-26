//
//  CartazVCollectionViewCell.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import UIKit

class CartazVCollectionViewCell: UICollectionViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var imageVMovieImageView: UIImageView!
	@IBOutlet weak var titleVMovieLabel: UILabel!
	@IBOutlet weak var dataVMovieLabel: UILabel!
	
	// MARK: - Variable
	static let identifier:String = "CartazVCollectionViewCell"
	private let urlBaseImage: String = "https://image.tmdb.org/t/p/w200"
	
	
	// MARK: - Lifecycle
	override func awakeFromNib() {
		super.awakeFromNib()
		self.configVImage()
	}
	
	
	// MARK: - Function
	static func nib () -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	private func configVImage() {
		self.imageVMovieImageView.layer.borderWidth = 1.5
		self.imageVMovieImageView.layer.borderColor = UIColor.lightGray.cgColor
		//clipsToBounds -> habilita edição na imagem
		self.imageVMovieImageView.clipsToBounds = true
		self.imageVMovieImageView.layer.cornerRadius = 30
	}
		
	func configCellTrending(movie: ResultTrending?) {
		let urlString: String = urlBaseImage + (movie?.posterPath ?? "")
		
		self.titleVMovieLabel.text = movie?.title
		self.dataVMovieLabel.text  = movie?.releaseDate
		
		if let url: URL = URL(string: urlString) {
			self.loadImage(url: url)
		}
	}
	
	func configCellNowPlaying(movie: ResultNowPlaying?) {
		let urlString: String = urlBaseImage + (movie?.posterPath ?? "")
		
		self.titleVMovieLabel.text = movie?.title
		self.dataVMovieLabel.text  = movie?.releaseDate
		
		if let url: URL = URL(string: urlString) {
			self.loadImage(url: url)
		}
	}
	
	private func loadImage(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.imageVMovieImageView.image = image
					}
				}
			}
		}
	}
	
}
