//
//  ElencoCollectionViewCell.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 26/02/21.
//

import UIKit

class ElencoCollectionViewCell: UICollectionViewCell {
	
	static let identifier: String = "ElencoCollectionViewCell"
	
	// MARK: - IBOutlet
	@IBOutlet weak var imageElencoImageView: UIImageView!
	@IBOutlet weak var nomeElencoLabel: UILabel!
	@IBOutlet weak var nomeArtElencolabel: UILabel!
	
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		configImageView()
	}
	
	func configImageView() {
		self.imageElencoImageView.layer.cornerRadius = self.imageElencoImageView.frame.height / 2
		self.imageElencoImageView.layer.borderWidth = 1.5
		self.imageElencoImageView.layer.borderColor = UIColor(named: "mainColor")?.cgColor
		self.imageElencoImageView.contentMode = .scaleAspectFill
	}
	
	
	func configCell(elenco: Elenco) {
		self.imageElencoImageView.image = elenco.imageElenco
		self.nomeElencoLabel.text = elenco.nome
		self.nomeArtElencolabel.text = elenco.nomeArt
	}
	
	
}
