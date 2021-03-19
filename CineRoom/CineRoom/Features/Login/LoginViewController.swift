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
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configTextField()
	}
	
	func configTextField() {
		self.emailtextField.delegate = self
		self.senhaTextField.delegate = self
        senhaTextField.inputAccessoryView = self.senhaTextField.inputToBar()
	}
	
	func validarEntrada() -> Bool{
		//validacao na Base.
		if emailtextField.validateEmail() && senhaTextField.validatePassword() {
			return true
		} else {
			return false
		}
		
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedConectar(_ sender: UIButton) {
		// Chamada de Func validar entrada
		if validarEntrada(){
			print("chamar tela conectar")
			performSegue(withIdentifier: "segueHome", sender: self)
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
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		textField.layer.borderColor = nil
	}
	
}

