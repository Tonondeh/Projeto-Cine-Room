//
//  HomeViewController.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 28/02/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	//    var arrayImagemTabBar:[UIImage] = [UIImage(named: "tabBar1") ?? UIImage(),
	//                                       UIImage(named: "tabBar2") ?? UIImage(),
	//                                       UIImage(systemName: "person") ?? UIImage()]
	
	var arrayVFilme:[Catalog] = [Catalog(titleSection: "Tendências", titleMovie: "Wonder Woman", date: "15 Dez 2020", imageMovie:                                      UIImage(named:"filmev12") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "The Litle Things", date: "27 Jan 2021", imageMovie: UIImage(named:"filmev8") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "Palmer", date: "29 Jan 2021", imageMovie: UIImage(named:"filmev4") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "Outside the Wire", date: "15 Jan 2021", imageMovie: UIImage(named:"filmev2") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "The Dig", date: "14 Jan 2021", imageMovie: UIImage(named:"filmev7") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "The Soul", date: "25 Dez 2020", imageMovie: UIImage(named:"filmev6") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "The White Tiger", date: "13 Jan 2021", imageMovie: UIImage(named:"filmev9") ?? UIImage())]
	
	var arrayHFilme:[Catalog] = [Catalog(titleSection: "Tendências", titleMovie: "Wonder Woman", date: "15 Dez 2020", imageMovie:                                      UIImage(named:"filmeh1") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "The Litle Things", date: "27 Jan 2021", imageMovie: UIImage(named:"filmeh2") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "Palmer", date: "29 Jan 2021", imageMovie: UIImage(named:"filmeh3") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "Outside the Wire", date: "15 Jan 2021", imageMovie: UIImage(named:"filmeh4") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "The Dig", date: "14 Jan 2021", imageMovie: UIImage(named:"filmeh5") ?? UIImage()),
										  Catalog(titleSection: "Tendências", titleMovie: "The Soul", date: "25 Dez 2020", imageMovie: UIImage(named:"filmeh6") ?? UIImage())]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configTableView()
	}
	
	
	func configTableView(){
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(VerticalTableViewCell.nib(), forCellReuseIdentifier: VerticalTableViewCell.identifier)
		self.tableView.register(HorizontalTableViewCell.nib(), forCellReuseIdentifier: HorizontalTableViewCell.identifier)
	}
	
	func getCell(linha:IndexPath, tableView:UITableView) -> UITableViewCell? {
		if linha.row == 1 {
			return tableView.dequeueReusableCell(withIdentifier: HorizontalTableViewCell.identifier, for: linha) as? HorizontalTableViewCell
		} else {
			return tableView.dequeueReusableCell(withIdentifier: VerticalTableViewCell.identifier, for: linha) as? VerticalTableViewCell
		}
	}
	
	func getArrayFilmes(indexPath: IndexPath) -> [Catalog] {
		if indexPath.row == 1 {
			return self.arrayHFilme
		} else {
			return self.arrayVFilme
		}
	}
	
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let filmes = getArrayFilmes(indexPath: indexPath)
		let cellH:HorizontalTableViewCell?
		let cellV:VerticalTableViewCell?
		
		if indexPath.row == 1 {
			cellH = tableView.dequeueReusableCell(withIdentifier: HorizontalTableViewCell.identifier, for: indexPath) as? HorizontalTableViewCell
			cellH?.getFilmes(value: filmes)
			return cellH ?? UITableViewCell()
		} else {
			cellV = tableView.dequeueReusableCell(withIdentifier: VerticalTableViewCell.identifier, for: indexPath) as? VerticalTableViewCell
			cellV?.getFilmes(value: filmes)
			return cellV ?? UITableViewCell()
		}
	}
	
}
