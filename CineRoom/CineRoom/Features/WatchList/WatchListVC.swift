//
//  WatchListVC.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 26/02/21.
//

import UIKit

struct WatchListFilme {
	let filmeImage: UIImage
	let nomeFilme: String
	let generoFilme: String
	let ratingFilme: String
}


class WatchListVC: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var listSegmented: UISegmentedControl!
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: - Variable
	var quantidadeLinhas: Int = 0
	var favoritosFilmes: [WatchListFilme] = [ WatchListFilme(filmeImage: UIImage(named: "filmeh1") ?? UIImage(),
																				nomeFilme: "Filme H 01",
																				generoFilme: "Ação, Aventura",
																				ratingFilme: "6.9"),
															WatchListFilme(filmeImage: UIImage(named: "filmeh2") ?? UIImage(),
																				nomeFilme: "Filme H 02",
																				generoFilme: "Aventura, Terror",
																				ratingFilme: "7.4"),
															WatchListFilme(filmeImage: UIImage(named: "filmeh3") ?? UIImage(),
																				nomeFilme: "Filme H 03",
																				generoFilme: "Horror, Terror",
																				ratingFilme: "1.4"),
															WatchListFilme(filmeImage: UIImage(named: "filmeh4") ?? UIImage(),
																				nomeFilme: "Filme H 03",
																				generoFilme: "Horror, Terror",
																				ratingFilme: "1.4")
	]
	var queroAssistirFilmes: [WatchListFilme] = [ WatchListFilme(filmeImage: UIImage(named: "filmeh6") ?? UIImage(),
																				nomeFilme: "Filme H 06",
																				generoFilme: "Ação, Aventura",
																				ratingFilme: "6.9"),
															WatchListFilme(filmeImage: UIImage(named: "filmeh5") ?? UIImage(),
																				nomeFilme: "Filme H 06",
																				generoFilme: "Aventura, Terror",
																				ratingFilme: "7.4")
	]
	var listaFilmes: [WatchListFilme] = []

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configTableView()
		configSegmentedControl()
	}
	
	
	// MARK: - Function
	func configTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.backgroundColor = UIColor(named: "backgroudColor")
		self.tableView.register(WatchListTableViewCell.nib(), forCellReuseIdentifier: WatchListTableViewCell.identifier)
	}
	
	func montaListaFilmes(index: Int) {
		self.listaFilmes = index == 0 ? self.favoritosFilmes : self.queroAssistirFilmes
	}
	
	func atualizaQtdLinhas(index: Int) {
		self.quantidadeLinhas = index == 0 ? self.favoritosFilmes.count : self.queroAssistirFilmes.count
	}
	
	func configSegmentedControl() {
		self.atualizaQtdLinhas(index: self.listSegmented.selectedSegmentIndex)
		self.montaListaFilmes(index: self.listSegmented.selectedSegmentIndex)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "segueDetalheStoryboard" {
			if let detalheVC = segue.destination as? DetalheFilmeVC {
				detalheVC.navigationItem.title = "TESTE"
			}
		}
	}
	
	
	
	// MARK: - Action
	@IBAction func didTapList(_ sender: UISegmentedControl) {
		self.atualizaQtdLinhas(index: self.listSegmented.selectedSegmentIndex)
		self.montaListaFilmes(index: self.listSegmented.selectedSegmentIndex)
		self.tableView.reloadData()
	}
	
	
}


// MARK: - Extension -> TableView
extension WatchListVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return quantidadeLinhas
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let filme = self.listaFilmes[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: WatchListTableViewCell.identifier, for: indexPath) as? WatchListTableViewCell
		
		cell?.configCell(filme: filme)
		
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("UISegmented atual: \(self.listSegmented.selectedSegmentIndex)")
		print("Selecionado Indice: \(indexPath.row)")
		
		
		self.performSegue(withIdentifier: "segueDetalheStoryboard", sender: self)
		
	}
	
	
}
