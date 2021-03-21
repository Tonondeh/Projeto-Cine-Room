//
//  ConfirmarSenhaViewController.swift
//  CineRoom
//
//  Created by ANDRE LUIZ TONON on 26/02/21.
//

import UIKit

class ConfirmarSenhaViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var novaSenhaTextField: UITextField!
	@IBOutlet weak var confirmarNovaSenha: UITextField!
	@IBOutlet weak var confirmarButton: UIButton!
	
	// MARK: - Variable
	let controller: ForgetPassController = ForgetPassController()
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configTextField()
		self.configButton()
	}
	
	
	// MARK: - Function
	private func configTextField() {
		self.novaSenhaTextField.delegate = self
		self.confirmarNovaSenha.delegate = self
		self.novaSenhaTextField.isSecureTextEntry = true
		self.confirmarNovaSenha.isSecureTextEntry = true
		self.novaSenhaTextField.inputAccessoryView = novaSenhaTextField.inputToBar()
		self.confirmarNovaSenha.inputAccessoryView = confirmarNovaSenha.inputToBar()
	}
	
	private func configButton() {
		self.confirmarButton.layer.cornerRadius = 5
	}
	
	
	// MARK: - IBAction
	@IBAction func confirmarButton(_ sender: UIButton) {
		if self.controller.validateForgetPassword(newPass: novaSenhaTextField, confNewPass: confirmarNovaSenha) {
			print("Confirmar")
			self.performSegue(withIdentifier: "segueLogin" , sender: nil)
		} else {
			print("Erro dados")
		}
	}
	
}


// MARK: - Extension TextField
extension ConfirmarSenhaViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}
