//
//  TrailerFilmeTableViewCell.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 28/02/21.
//

import UIKit

class TrailerFilmeTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var nomeTrailerLabel: UILabel!
	@IBOutlet weak var iconImageView: UIImageView!
	
	
	// MARK: - Variable
	static let identifier: String = "TrailerFilmeTableViewCell"
	
	
	// MARK: - Lifecycle
	override func awakeFromNib() {
		super.awakeFromNib()
		configImageView()
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	func configImageView() {
		self.iconImageView.image = UIImage(systemName: "play.rectangle")
		self.iconImageView.tintColor = UIColor(named: "secondColor")
	}
	
	func configCell(video: ResultVideos?) {
		guard let video = video else { return }
		self.nomeTrailerLabel.text = video.name
	}
	
}
