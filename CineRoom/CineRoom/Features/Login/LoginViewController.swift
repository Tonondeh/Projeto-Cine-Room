//
//  LoginViewController.swift
//  Cine Room
//
//  Created by Lucas Munho on 23/02/21.
//

import UIKit

enum SegueName : String {
    case home = "segueHome"
}

enum ButtonEdges : CGFloat {
    case corner = 5
}


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
		
        self.configTextField()
        self.configButton()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.showSpinner()
		
		self.controller.addStateDidChangeListener { (success) in
			if success {
                self.performSegue(withIdentifier: SegueName.home.rawValue, sender: nil)
			}
			self.removeSpinner()
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.controller.removeStateDidChangeListener()
	}
	
	
	// MARK: - Function	
	private func configTextField() {
		self.emailtextField.delegate = self
		self.senhaTextField.delegate = self
		self.senhaTextField.inputAccessoryView = self.senhaTextField.inputToolbar()
	}
	
	private func configButton() {
        self.createAccountButton.layer.cornerRadius	= ButtonEdges.corner.rawValue
		self.connectButton.layer.cornerRadius = ButtonEdges.corner.rawValue
	}
	
	
	// MARK: - IBAction
	@IBAction func tappedConectar(_ sender: UIButton) {
		
		if self.controller.validateLogin(emailTextField: emailtextField,
													passwordTextField: senhaTextField) {
			
			self.showSpinner()
			
			self.controller.signIn(email: emailtextField.text, password: senhaTextField.text) { (success) in
				if success {
					print("=== LOGIN FIREBASE")
					Utils.saveUserDefaults(value: self.emailtextField.text, key: "email")
                    self.performSegue(withIdentifier: SegueName.home.rawValue, sender: nil)
				} else {
					print("=== erro LOGIN FIREBASE")
					self.showAlertAnimation()
					
				}
				self.removeSpinner()
			}
			
		} else {
		
			
			if !self.emailtextField.validateEmail() {
				self.emailtextField.shake()
                print("Entrada errada - e-mail")
			}
			if !self.senhaTextField.validatePassword() {
				self.senhaTextField.shake()
                print("Entrada errada - senha")
			}
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
