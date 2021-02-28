//
//  CartazVCollectionViewCell.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import UIKit

class CartazVCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageVMovieImageView: UIImageView!
    @IBOutlet weak var titleVMovieLabel: UILabel!
    @IBOutlet weak var dataVMovieLabel: UILabel!
    
    static let identifier:String = "CartazVCollectionViewCell"
    static func nib () -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func configVCell(value:Catalog) {
        self.imageVMovieImageView.image = value.imageMovie
        self.titleVMovieLabel.text = value.titleMovie
        self.dataVMovieLabel.text = value.date
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configVImage()
    }

    func configVImage() {
        self.imageVMovieImageView.layer.borderWidth = 1.5
        self.imageVMovieImageView.layer.borderColor = UIColor.lightGray.cgColor
        //clipsToBounds -> habilita edição na imagem
        self.imageVMovieImageView.clipsToBounds = true
        self.imageVMovieImageView.layer.cornerRadius = 30
    }
    
}
