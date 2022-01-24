//
//  EsqueciSenhaViewController.swift
//  CineRoom
//
//  Created by ANDRE LUIZ TONON on 26/02/21.
//

import UIKit

class EsqueciSenhaViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var continuarButton: UIButton!
    
    
    //MARK:- Variavel
    
    private let controller:ForgetPassController = ForgetPassController()
    
    
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
    
    
    
    // MARK: - IBAction
    @IBAction func tappedContinuarButton(_ sender: UIButton) {
        
        if emailTextField.validateEmail() {
            controller.sendPasswordReset(email: emailTextField) { (success) in
                if success {
                    self.performSegue(withIdentifier: "LoginSegue", sender: nil)
                }else{
                    Alert.showInvalidEmailAlert(onVC: self)
                    print("Deu Ruim")
                }
                
            }
        } else {
            self.emailTextField.shake()
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


