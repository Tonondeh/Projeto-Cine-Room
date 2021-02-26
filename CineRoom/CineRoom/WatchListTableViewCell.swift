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
	
	func configCell(filme: WatchListFilme) {
		self.filmeImageView.image	= filme.filmeImage
		self.nomeLabel.text 			= filme.nomeFilme
		self.generoLabel.text 		= filme.generoFilme
		self.ratingLabel.text 		= filme.ratingFilme
	}
	
	
}
