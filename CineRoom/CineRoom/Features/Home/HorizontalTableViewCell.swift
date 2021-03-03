//
//  HorizontalTableViewCell.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import UIKit

class HorizontalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier:String = "HorizontalTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    private var filmes:[Catalog] = []
    
    var delegate:CellDelegate?
    
    func getFilmes(value:[Catalog]) {
        self.filmes = value
        self.collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configCollectionView()
    }
    
    func configCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor(named: "backgroundColor")
        self.collectionView.register(CartazHCollectionViewCell.nib(), forCellWithReuseIdentifier: CartazHCollectionViewCell.identifier)
    }
    
}

extension HorizontalTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellH = collectionView.dequeueReusableCell(withReuseIdentifier: CartazHCollectionViewCell.identifier, for: indexPath) as? CartazHCollectionViewCell
            cellH?.configHCell(value: self.filmes[indexPath.row])
            return cellH ?? UICollectionViewCell()
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 240, height: 155)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectedCell(index: indexPath.row)
        print("banana1")
    }
    
}
