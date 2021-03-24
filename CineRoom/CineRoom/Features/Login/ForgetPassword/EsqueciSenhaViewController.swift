//
//  EsqueciSenhaViewController.swift
//  CineRoom
//
//  Created by ANDRE LUIZ TONON on 26/02/21.
//

import UIKit
import Firebase

class EsqueciSenhaViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var continuarButton: UIButton!
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configTextField()
		self.configButton()
	}
	
	
	// MARK: - Function
	private func configTextField() {
		self.emailTextField.delegate = self
	}
	
	private func configButton() {
		self.continuarButton.layer.cornerRadius = 5
	}
	
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            callback?(error)
        }
    }
    
    
	
	// MARK: - IBAction
	@IBAction func tappedContinuarButton(_ sender: UIButton) {
		
		if emailTextField.validateEmail() {
			print("Segue Proxima Tela")
			
            self.sendPasswordReset(withEmail: emailTextField.text ?? "") { (error) in
                if error == nil {
                    print("Tela Login")
                }else{
                    let _error = error as NSError?
                    if _error?.code == 17011 {
                        print("Email invalido")
                        Alert.showInvalidEmailAlert(on: self)
                    }
                }
            }

		} else {
			print("Erro na validação")
		}
		
	}
	
}


// MARK: - Extension TextField
extension EsqueciSenhaViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}
