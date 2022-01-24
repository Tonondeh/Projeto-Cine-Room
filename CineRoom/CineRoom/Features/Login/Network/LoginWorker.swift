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


class LoginWorker: NSObject {
	
	private let handle = Auth.auth()
	
	func createUserFirebase(email: String?, password: String?, completion: @escaping(_ success: Bool, _ errorCode: Int?) -> Void) {
		
		guard let email = email, let password = password else {
			return completion(false, nil)
		}
		
		handle.createUser(withEmail: email, password: password) { (authResult, error) in
			
			if error == nil {
				completion(true, nil)
				
			} else {
				let error = error as NSError?
				completion(false, error?.code)
			}
		}
	}
	
	func signInCredential(credential: AuthCredential, completion: @escaping(_ success: Bool) -> Void) {
		
		handle.signIn(with: credential) { (authResult, error) in
			
			if error != nil {
				print("Error> \(String(describing: error?.localizedDescription))")
				completion(false)
			} else {
				
				if authResult == nil {
					print("Error> \(String(describing: error?.localizedDescription))")
					completion(false)
				} else {
					completion(true)
				}
				
			}
		}
		
	}
	
	func signIn(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
		
		guard let email = email, let password = password else {
			return completion(false)
		}
		
		handle.signIn(withEmail: email, password: password) { (authResult, error) in
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
	
	func logOut() {
		do {
			try handle.signOut()
		}  catch{
			print("erro ao sair")
			
		}
	}
	
	func addStateDidChangeListener(completion: @escaping(_ success: User?) -> Void) {
		
		handle.addStateDidChangeListener { (auth, user) in
			if user == nil {
				completion(nil)
			} else {
				
				completion(user)
			}
		}
	}
	
	func removeStateDidChangeListener() {
		Auth.auth().removeStateDidChangeListener(handle)
	}
	
	func signInFacebook(viewController: UIViewController, completion: @escaping(_ success: AuthCredential?) -> Void) {
		let loginManager = LoginManager()
		
		loginManager.logIn(permissions: ["public_profile", "email"], from: viewController) { (loginResult, error) in
			
			if let error = error {
				print("Erro no LogIn Facebook")
				print(error.localizedDescription)
				completion(nil)
				return
			}
			
			if let token = loginResult?.token {
				let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
				completion(credential)
			} else {
				completion(nil)
			}
			
		}
		
		
	}
	
	func sendPasswordReset(withEmail email: String? , _ callback: ((Error?) -> ())? = nil){
		handle.sendPasswordReset(withEmail: email ?? "" ) { error in
			callback?(error)
		}
		
	}
}
