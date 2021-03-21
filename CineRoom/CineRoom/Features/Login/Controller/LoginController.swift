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
	
}
