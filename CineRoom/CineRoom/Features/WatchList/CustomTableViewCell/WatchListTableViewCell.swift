//
//  WatchListTableViewCell.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 26/02/21.
//

import UIKit

class WatchListTableViewCell: UITableViewCell {
	
	static let identifier: String = "WatchListTableViewCell"
	
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
		
		if let _filme = filme {
			//			self.filmeImageView.image	= filme.filmeImage
			self.nomeLabel.text = _filme.name
			self.generoLabel.text = _filme.genre
			self.ratingLabel.text = _filme.rating
		}
		
	}
	
	
}
