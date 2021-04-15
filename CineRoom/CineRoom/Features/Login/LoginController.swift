//
//  LoginController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 21/03/21.
//

import Foundation
import UIKit

class LoginController {
	
	func validateLogin(emailTextField: UITextField, passwordTextField: UITextField) -> Bool {
		if emailTextField.validateEmail() && passwordTextField.validatePassword() {
			return true
		} else {
			return false
		}
	}
	
	func addStateDidChangeListener(completion: @escaping(_ success: Bool) -> Void) {
		LoginWorker().addStateDidChangeListener { (success) in
			if success != nil {
				print("== User logado: \(String(describing: success)) ==")
                Utils.saveUserDefaults(value: success?.email, key: "email")
                completion(true)
			} else {
				completion(false)
			}
			
		}
	}
	
	func removeStateDidChangeListener() {
		LoginWorker().removeStateDidChangeListener()
	}
	
	func signIn(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
		LoginWorker().signIn(email: email, password: password) { (success) in
			completion(success)
		}
	}
	
}
