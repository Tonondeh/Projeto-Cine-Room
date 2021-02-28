//
//  CartazHCollectionViewCell.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import UIKit

class CartazHCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageHMovieImageView: UIImageView!
    @IBOutlet weak var titleHMovieLabel: UILabel!
    @IBOutlet weak var dataHMovieLabel: UILabel!
    
    static let identifier:String = "CartazHCollectionViewCell"
    static func nib () -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func configHCell (value:Catalog) {
        self.imageHMovieImageView.image = value.imageMovie
        self.titleHMovieLabel.text = value.titleMovie
        self.dataHMovieLabel.text = value.date
    }
    
        override func awakeFromNib() {
            super.awakeFromNib()
            self.configHMovie()
        }

    func configHMovie () {
        self.imageHMovieImageView.layer.borderWidth = 1.5
        self.imageHMovieImageView.layer.borderColor = UIColor.lightGray.cgColor
        self.imageHMovieImageView.clipsToBounds = true
        self.imageHMovieImageView.layer.cornerRadius = 30
    }

}
