//
//  WatchListTableViewCell.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 26/02/21.
//

import UIKit

class WatchListTableViewCell: UITableViewCell {
	
	static let identifier: String = "WatchListTableViewCell"
	private let urlBaseImage: String = "https://image.tmdb.org/t/p/w200"
	
	// MARK: - IBOutlet
	@IBOutlet weak var filmeImageView: UIImageView!
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var generoLabel: UILabel!
	@IBOutlet weak var ratingLabel: UILabel!
	@IBOutlet weak var backgroundCellView: UIView!
	
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configView()
		configImageView()
	}
	
	func configView() {
		self.backgroundCellView.layer.cornerRadius = 10
	}
	
	func configImageView() {
		self.filmeImageView.layer.cornerRadius = 15
	}
	
	func configCell(filme: WatchModel?) {
		let urlString: String = urlBaseImage + (filme?.foto ?? "")
		
		self.nomeLabel.text = filme?.name
		self.nomeLabel.text = filme?.name
		self.generoLabel.text = filme?.genre
		self.ratingLabel.text = filme?.rating
			if let url: URL = URL(string: urlString) {
				self.loadImage(url: url)
			}
	}
	
	private func loadImage(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.filmeImageView.image = image
					}
				}
			}
		}
	}
	
}
