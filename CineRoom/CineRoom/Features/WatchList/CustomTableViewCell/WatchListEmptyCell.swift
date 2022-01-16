//
//  WatchListEmptyCell.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 01/04/21.
//

import UIKit

class WatchListEmptyCell: UITableViewCell {
	
	// MARK: - Variable
	static let identifier: String = "WatchListEmptyCell"
	
	
	// MARK: - Lifecycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: "WatchListEmptyCell", bundle: nil)
	}
	
}
