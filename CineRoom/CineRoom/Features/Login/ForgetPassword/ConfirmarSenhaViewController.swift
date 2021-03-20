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
	@IBOutlet var confirmarButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configTextField()
	}
	
	func configTextField() {
		self.novaSenhaTextField.delegate = self
		self.novaSenhaTextField.layer.borderWidth = 2.0
		self.novaSenhaTextField.backgroundColor = .white
		self.novaSenhaTextField.layer.borderColor = UIColor.lightGray.cgColor
		
		self.confirmarNovaSenha.delegate = self
		self.confirmarNovaSenha.layer.borderWidth = 2.0
		self.confirmarNovaSenha.backgroundColor = .white
		self.confirmarNovaSenha.layer.borderColor = UIColor.lightGray.cgColor
		
		let toolbar = UIToolbar()
		toolbar.barStyle = .default
		toolbar.isTranslucent = true
		toolbar.tintColor = .blue
		toolbar.backgroundColor = .white
		toolbar.sizeToFit()
		
		let buttonOK = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(finish))
		let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		
		toolbar.setItems([spaceButton, buttonOK], animated: true)
		toolbar.isUserInteractionEnabled = true
		
		novaSenhaTextField.inputAccessoryView = toolbar
		confirmarNovaSenha.inputAccessoryView = toolbar
	}
	
	@objc
	func finish() {
		self.novaSenhaTextField.resignFirstResponder()
		self.confirmarNovaSenha.resignFirstResponder()
	}
	
	func validarDados() -> Bool {
		if novaSenhaTextField.validatePassword() && confirmarNovaSenha.validatePassword() && novaSenhaTextField.text == confirmarNovaSenha.text {
			return true
		} else {
			return false
		}
	}
	
	
	// MARK: - IBAction
	@IBAction func confirmarButton(_ sender: UIButton) {
		if self.validarDados() {
			print("Confirmar")
			self.performSegue(withIdentifier:"segueLogin" , sender: self)
		} else {
			print("Erro dados")
		}
	}
	
}


extension ConfirmarSenhaViewController: UITextFieldDelegate {
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		novaSenhaTextField.layer.borderColor = UIColor.blue.cgColor
		confirmarNovaSenha.layer.borderColor = UIColor.blue.cgColor
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}
