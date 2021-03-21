//
//  EsqueciSenhaViewController.swift
//  CineRoom
//
//  Created by ANDRE LUIZ TONON on 26/02/21.
//

import UIKit

class EsqueciSenhaViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var continuarButton: UIButton!
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configTextField()
		self.configButton()
	}
	
	
	// MARK: - Function
	private func configTextField() {
		self.emailTextField.delegate = self
	}
	
	private func configButton() {
		self.continuarButton.layer.cornerRadius = 5
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedContinuarButton(_ sender: UIButton) {
		
		if emailTextField.validateEmail() {
			print("Segue Proxima Tela")
			self.performSegue(withIdentifier: "SegueContinuar", sender: nil)
		} else {
			print("Erro na validação")
		}
		
	}
	
}


// MARK: - Extension TextField
extension EsqueciSenhaViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}
