//
//  ElencoCollectionViewCell.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 28/02/21.
//

import UIKit

class ElencoCollectionViewCell: UICollectionViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var imageElencoImageView: UIImageView!
	@IBOutlet weak var nomeElencoLabel: UILabel!
	@IBOutlet weak var nomeArtElencolabel: UILabel!
	
	
	// MARK: - Variable
	static let identifier: String = "ElencoCollectionViewCell"
	private let urlBaseImage: String = "https://image.tmdb.org/t/p/w200"
	
	
	// MARK: - Lifecycle
	override func awakeFromNib() {
		super.awakeFromNib()
		configImageView()
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	private func configImageView() {
		self.imageElencoImageView.layer.cornerRadius = self.imageElencoImageView.frame.height / 2
		self.imageElencoImageView.layer.borderWidth = 1.5
		self.imageElencoImageView.layer.borderColor = UIColor(named: "mainColor")?.cgColor
		self.imageElencoImageView.contentMode = .scaleAspectFill
	}
	
	func configCell(cast: Cast?) {
		guard let cast = cast else { return }
		self.nomeElencoLabel.text = cast.originalName
		self.nomeArtElencolabel.text = cast.character
		
		if cast.profilePath != nil {
			let urlString: String = urlBaseImage + (cast.profilePath ?? "")
			if let url: URL = URL(string: urlString) {
				self.loadImage(url: url)
			}
		}
		
	}
	
	private func loadImage(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.imageElencoImageView.image = image
					}
				}
			}
		}
	}
	
}
