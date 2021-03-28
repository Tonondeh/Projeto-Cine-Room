//
//  CriarContaController.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 21/03/21.
//

import Foundation
import UIKit
import FirebaseAuth
import GoogleSignIn

protocol CriarContaProtocol  {
	func loginGoogleFinish(_ success: Bool)
}

class CriarContaController: NSObject {
	
	var delegate: CriarContaProtocol?
	
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
	
	func signInFacebook(viewController: UIViewController, completion: @escaping(_ success: Bool) -> Void) {
		
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
	
	func signInGoogle(delegate: CriarContaProtocol) {
		self.delegate = delegate
		GIDSignIn.sharedInstance()?.delegate = self
		GIDSignIn.sharedInstance()?.signIn()
	}
	
	func createUser(nameDisplay: String?, nameFull: String?, email: String?, cpf: Int64, dateBrith: Date?) {
		DataManager().createUser(nameDisplay: nameDisplay, nameFull: nameFull, email: email, cpf: cpf, dateBrith: dateBrith)
	}
	
}


// MARK: - Extension Google SignInt
extension CriarContaController: GIDSignInDelegate {

	func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {

		if error != nil {
			print("Erro no SingIn-Google")
			print("\(error.debugDescription)")
		}

		if user != nil {
			print("==== USUARIO LOGADO [GIDSignInDelegate]!!!")
			print("Nome: \(String(describing: user.profile.name))")
			print("Email: \(String(describing: user.profile.email))")

			// Obter a Imagem do Profile Google
			//			let data = try? Data(contentsOf: _imagem)
			//			if let imageData = data {
			//				self.profileImageView.image = UIImage(data: imageData)
			//			}

			// Autenticacao com o Firebase
			guard let authentication = user.authentication else { return }
			let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
																		  accessToken: authentication.accessToken)
			signInCredential(credential: credential) { (success) in
				self.delegate?.loginGoogleFinish(success)
			}
		}
	}

}
