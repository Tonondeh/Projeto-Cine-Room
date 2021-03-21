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
		LoginWorker().signInCredential(credential: credential) { (success) in
			completion(success)
		}
	}
	
}
