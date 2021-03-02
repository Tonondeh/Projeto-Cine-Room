//
//  VerticalTableViewCell.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import UIKit

class VerticalTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier:String = "VerticalTableViewCell"
    static func nib () -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    private var filmes:[Catalog] = []
    
    func getFilmes(value:[Catalog]){
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
        self.collectionView.register(CartazVCollectionViewCell.nib(), forCellWithReuseIdentifier: CartazVCollectionViewCell.identifier)
    }
    
}
    
extension VerticalTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellV = collectionView.dequeueReusableCell(withReuseIdentifier: CartazVCollectionViewCell.identifier, for: indexPath) as? CartazVCollectionViewCell
            cellV?.configVCell(value: self.filmes[indexPath.row])
        return cellV ?? UICollectionViewCell()
    }
	
}
