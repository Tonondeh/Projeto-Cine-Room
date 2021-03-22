//
//  CriarContaController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 21/03/21.
//

import Foundation
import UIKit
import FirebaseAuth

class CriarContaController {
	
	func validarCriarConta(nome: UITextField, email: UITextField, senha: UITextField, confSenha: UITextField) -> Bool {
		if nome.validateName() && email.validateEmail() && senha.validatePassword() && confSenha.validatePassword() && senha.text == confSenha.text {
			return true
		} else {
			return false
		}
	}
	
	func createUserFirebase(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
		LoginWorker().createUserFirebase(email: email, password: password) { (success) in
			completion(success)
		}
	}
	
	func signInCredential(credential: AuthCredential, completion: @escaping(_ success: Bool) -> Void) {
		print(#function)
		LoginWorker().signInCredential(credential: credential) { (success) in
			completion(success)
		}
	}
	
	func signInGoogle(completion: @escaping(_ success: Bool) -> Void) {
		print(#function)
		let loginWorker = LoginWorker()
		loginWorker.delegate = self
		loginWorker.signInGoogle { (success) in
			completion(success)
		}
	
	}
	
	func signInFacebook(viewController: UIViewController, completion: @escaping(_ success: Bool) -> Void) {
		print(#function)
		
		LoginWorker().signInFacebook(viewController: viewController) { (credential) in
			
			if let _credential = credential {
				self.signInCredential(credential: _credential) { (success) in
					completion(success)
				}
			} else {
				completion(false)
			}
		}
	}
	
}


// MARK: - Extension
extension CriarContaController: LoginWorkerProtocol {
	
	func credentialGoogle(credential: AuthCredential) {
		print(#function)
		self.credentialGoogle(credential: credential)
	}
	
	
}
