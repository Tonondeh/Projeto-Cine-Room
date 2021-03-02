//
//  TrailerFilmeTableViewCell.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 28/02/21.
//

import UIKit

class TrailerFilmeTableViewCell: UITableViewCell {
	
	static let identifier: String = "TrailerFilmeTableViewCell"
	
	// MARK: - IBOutlet
	@IBOutlet weak var nomeTrailerLabel: UILabel!
	@IBOutlet weak var iconImageView: UIImageView!
	
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configImageView()
	}
	
	func configImageView() {
		self.iconImageView.image = UIImage(systemName: "play.rectangle")
		self.iconImageView.tintColor = UIColor(named: "secondColor")
	}
	
	func configCell(detalhe: DetalheFilme) {
		self.nomeTrailerLabel.text = detalhe.nomeFilme
	}
	
}
