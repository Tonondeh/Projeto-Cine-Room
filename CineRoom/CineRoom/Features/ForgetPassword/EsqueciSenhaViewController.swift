//
//  EsqueciSenhaViewController.swift
//  CineRoom
//
//  Created by ANDRE LUIZ TONON on 26/02/21.
//

import UIKit

class EsqueciSenhaViewController: UIViewController {

 
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var continuarButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTextField()
        self.habilitarBotaoContinuar()
        //        self.continuarButton.isEnabled = false
    }
    
    func configTextField(){
        
        self.emailTextField.delegate = self
        self.emailTextField.layer.borderWidth = 2.0
        self.emailTextField.backgroundColor = .white
        self.emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }
    
    @IBAction func tappedContinuarButton(_ sender: UIButton) {
        if validarEmail(){
            print("Segue Proxima Tela")
            
        }
        
    }
    
    func habilitarBotaoContinuar(){
        if self.emailTextField.text != "" {
            self.continuarButton.isEnabled = true
        }else{
            self.continuarButton.isEnabled = false
        }
    }
   
    func validarEmail() -> Bool{
        if self.emailTextField.text != ""{
            return true
        }else{
            self.emailTextField.layer.borderColor = UIColor.red.cgColor
            return false
        }
    }
    
}

extension EsqueciSenhaViewController:UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        habilitarBotaoContinuar()
        
    
        
        return validarEmail()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        if self.emailTextField.text == ""{
//            self.emailTextField.layer.borderColor = UIColor.red.cgColor
//        }else{
//            self.emailTextField.layer.borderColor = UIColor.lightGray.cgColor
//        }
        
//        self.habilitarBotaoContinuar()
        
    }
    
    
}
