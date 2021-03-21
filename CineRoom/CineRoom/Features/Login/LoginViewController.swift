//
//  LoginViewController.swift
//  Cine Room
//
//  Created by Lucas Munho on 23/02/21.
//

import UIKit

class LoginViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var loginImageView: UIImageView!
	@IBOutlet weak var emailtextField: UITextField!
	@IBOutlet weak var senhaTextField: UITextField!
	@IBOutlet weak var createAccountButton: UIButton!
	@IBOutlet weak var connectButton: UIButton!
	
	// MARK: - Variable
	let controller: LoginController = LoginController()
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		configTextField()
		configButton()
	}
	
	
	// MARK: - Function
	private func configTextField() {
		self.emailtextField.delegate = self
		self.senhaTextField.delegate = self
		self.senhaTextField.inputAccessoryView = self.senhaTextField.inputToBar()
	}
	
	private func configButton() {
		self.createAccountButton.layer.cornerRadius	= 5
		self.connectButton.layer.cornerRadius 		 	= 5
	}
		
	
	// MARK: - IBAction
	@IBAction func tappedConectar(_ sender: UIButton) {
		
		if self.controller.validateLogin(emailTextField: emailtextField,
													passwordTextField: senhaTextField) {
			print("chamar tela conectar")
			performSegue(withIdentifier: "segueHome", sender: nil)
		} else {
			print("Entrada errada")
		}
	}
	
}


// MARK: - Extension TextField
extension LoginViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}

