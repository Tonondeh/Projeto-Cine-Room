//
//  LoginWorker.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 21/03/21.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn

protocol LoginWorkerProtocol {
	func credentialGoogle(credential: AuthCredential)
}

class LoginWorker: NSObject {
	
	private let handle = Auth.auth()
	
	var delegate: LoginWorkerProtocol?
	
	
	func createUserFirebase(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
		
		// Verificar o que retornar para Controller
		// Dados do User.
		
		guard let _email = email, let _password = password else {
			return completion(false)
		}
		
		handle.createUser(withEmail: _email, password: _password) { (authResult, error) in
			
			if error != nil {
				completion(false)
			}
			
			if authResult == nil {
				completion(false)
			} else {
				completion(true)
			}
			
		}
		
	}
	
	func signInCredential(credential: AuthCredential, completion: @escaping(_ success: Bool) -> Void) {
		
		handle.signIn(with: credential) { (authResult, error) in
			if error != nil {
				print(error?.localizedDescription)
				completion(false)
			} else {
				
				if authResult == nil {
					print(error?.localizedDescription)
					completion(false)
				} else {
					completion(true)
				}
				
			}
		}
		
	}
	
	func signIn(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
		
		// Verificar o que retornar para Controller
		// Dados do User.
		
		guard let _email = email, let _password = password else {
			return completion(false)
		}
		
		handle.signIn(withEmail: _email, password: _password) { (authResult, error) in
			if error != nil {
				completion(false)
			} else {
				
				if authResult == nil {
					completion(false)
				} else {
					completion(true)
				}
				
			}
		}
		
	}
	
	func addStateDidChangeListener(completion: @escaping(_ success: String?) -> Void) {
		
		// Verificar o que retornar para Controller
		// Dados do User.
		
		handle.addStateDidChangeListener { (auth, user) in
			if user == nil {
				completion(nil)
			} else {
				completion(user?.email)
			}
		}
	}
	
	func removeStateDidChangeListener() {
		Auth.auth().removeStateDidChangeListener(handle)
	}
	
	func signInFacebook(viewController: UIViewController, completion: @escaping(_ success: AuthCredential?) -> Void) {
		let loginManager = LoginManager()
		
		loginManager.logIn(permissions: ["public_profile", "email"], from: viewController) { (loginResult, error) in
			
			if let _error = error {
				print("Erro no LogIn Facebook")
				print(_error.localizedDescription)
				completion(nil)
				return
			}
			
			guard let accessToken = AccessToken.current else { return completion(nil) }
			
			let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
			completion(credential)
			
		}
		
		
	}
	
	func signInGoogle(completion: @escaping(_ success: Bool) -> Void) {
		GIDSignIn.sharedInstance()?.delegate = self
		GIDSignIn.sharedInstance()?.signIn()
		completion(true)
	}
	
}


// MARK: - Extension Google SignInt
extension LoginWorker: GIDSignInDelegate {
	
	func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
		print("didSignInFor")
		
		if error != nil {
			print("Erro no SingIn-Google")
			print(error.localizedDescription)
		}
		
		if user != nil {
			
			print("==== USUARIO LOGADO!!!")
			print("Nome: \(String(describing: user.profile.name))")
			print("Email: \(String(describing: user.profile.email))")
			
			// Obter a Imagem do Profile Google
			//			let data = try? Data(contentsOf: _imagem)
			//			if let imageData = data {
			//				self.profileImageView.image = UIImage(data: imageData)
			//			}
			
			// Autenticacao com o Firebase
			guard let authentication = user.authentication else { return }
			print("authentication: \(authentication)")
			
			let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
																		  accessToken: authentication.accessToken)
			
			self.delegate?.credentialGoogle(credential: credential)
			
			// SignIn no Firebse
//			self.controller.signInCredential(credential: credential) { (success) in
//				if success {
//					print("=== SUCESSO AO CRIAR CONTA GOOGLE NO FIREBASE ===")
//					self.performSegue(withIdentifier: "segueHomeStoryboard", sender: nil)
//				} else {
//					print("=== ERRO AO CRIAR CONTA GOOGLE NO FIREBASE ===")
//				}
//			}
			
		}
		
		
	}
	
}

