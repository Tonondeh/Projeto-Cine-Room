//
//  CriarContaController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 21/03/21.
//

import Foundation
import UIKit

class CriarContaController {
	
	func validarCriarConta(nome: UITextField, email: UITextField, senha: UITextField, confSenha: UITextField) -> Bool {
		if nome.validateName() && email.validateEmail() && senha.validatePassword() && confSenha.validatePassword() && senha.text == confSenha.text {
			return true
		} else {
			return false
		}
	}
	
}
