//
//  Alert.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 26/02/21.
//

import Foundation
import UIKit

struct Alert {
	
	private static func showBasicAlert(onVC viewController: UIViewController, with title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		DispatchQueue.main.async { viewController.present(alert, animated: true) }
	}
	
	static func showIncompleteFormAlert(onVC viewController: UIViewController) {
		showBasicAlert(onVC: viewController, with: "Cadastro incompleto", message: "Sua senha deve conter pelo menos 6 números.")
	}
	
	static func showInvalidEmailAlert(onVC viewController: UIViewController) {
		showBasicAlert(onVC: viewController, with: "Email Inválido", message: "Por favor, utilizar um email válido !!!")
	}
	
	static func showWrongAlert(onVC viewController: UIViewController) {
		showBasicAlert(onVC: viewController, with: "Dados Incorretos", message: "Por favor, verifique os dados !!!")
	}
	
	static func showErrorCreateUserFirebase(onVC viewController: UIViewController, code: Int?) {
		
		switch code {
			case 17007:
				print("==>> Erro na criacao de User no Firebase - Code 17007")
				showBasicAlert(onVC: viewController, with: "Erro na criação de usuário",
									message: "Esse e-mail já está sendo usado por outra pessoa, digite outro e-mail!")
				
			case 17008:
				print("==>> Erro na criacao de User no Firebase - Code 17008")
				showBasicAlert(onVC: viewController, with: "Erro na criação de usuário",
									message: "E-mail invalido, digite um E-mail válido.")
				
			case 17026:
				print("==>> Erro na criacao de User no Firebase - Code 17007")
				showBasicAlert(onVC: viewController, with: "Erro na criação de usuário",
									message: "Senha precisa ter no mínimo 6 caracteres, com letras e números")
				
			default:
				print("==>> Erro na criacao de User no Firebase - Code \(code ?? 0)")
				showBasicAlert(onVC: viewController, with: "Erro na criação de usuário",
									message: "Serviço indisponível, tente mais tarde")
		}
		
	}
	
}


