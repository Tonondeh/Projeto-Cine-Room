//
//  CartazHCollectionViewCell.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import UIKit

class CartazHCollectionViewCell: UICollectionViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var imageHMovieImageView: UIImageView!
	@IBOutlet weak var titleHMovieLabel: UILabel!
	@IBOutlet weak var dataHMovieLabel: UILabel!
	
	// MARK: - Variable
	static let identifier:String = "CartazHCollectionViewCell"
	private let urlBaseImage: String = "https://image.tmdb.org/t/p/w200"
	
	
	// MARK: - Lifecyle
	override func awakeFromNib() {
		super.awakeFromNib()
		self.configHMovie()
	}
	
	
	// MARK: - Function
	static func nib () -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	private func configHMovie() {
		self.imageHMovieImageView.layer.borderWidth  = 1.5
		self.imageHMovieImageView.layer.borderColor  = UIColor.lightGray.cgColor
		self.imageHMovieImageView.clipsToBounds      = true
		self.imageHMovieImageView.layer.cornerRadius = 30
	}
	
	private func loadImage(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.imageHMovieImageView.image = image
					}
				}
			}
		}
	}
	
	func configHCell(movie: ResultPopular?) {
		let urlString: String = urlBaseImage + (movie?.backdropPath ?? "")
		
		if let url: URL = URL(string: urlString) {
			self.loadImage(url: url)
		}
		self.titleHMovieLabel.text = movie?.title
		self.dataHMovieLabel.text = convertData(movie?.releaseDate ?? "")
	}
	
}
