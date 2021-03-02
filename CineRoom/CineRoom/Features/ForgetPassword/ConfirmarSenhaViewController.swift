//
//  ConfirmarSenhaViewController.swift
//  CineRoom
//
//  Created by ANDRE LUIZ TONON on 26/02/21.
//

import UIKit

class ConfirmarSenhaViewController: UIViewController {
    
    
    
    @IBOutlet weak var novaSenhaTextField: UITextField!
    
    @IBOutlet weak var confirmarNovaSenha: UITextField!
    
    @IBOutlet var confirmarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTextField()
        self.habilitarBotaoConfirmar()
    }
    
    func configTextField(){
        self.novaSenhaTextField.delegate = self
        self.novaSenhaTextField.layer.borderWidth = 2.0
        self.novaSenhaTextField.backgroundColor = .white
        self.novaSenhaTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        self.confirmarNovaSenha.delegate = self
        self.confirmarNovaSenha.layer.borderWidth = 2.0
        self.confirmarNovaSenha.backgroundColor = .white
        self.confirmarNovaSenha.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    @IBAction func confirmarButton(_ sender: UIButton) {
        if self.novaSenhaTextField.text == self.confirmarNovaSenha.text {
            print("Confirmar")
            self.performSegue(withIdentifier:"SegueLoginStoryboard" , sender: self)
            
        }
    }
    
    func habilitarBotaoConfirmar(){
        if self.confirmarNovaSenha.text != "" {
            self.confirmarButton.isEnabled = true
        }else{
            self.confirmarButton.isEnabled = false
        }
    }
    
    func validarNovaSenha() -> Bool{
        if self.novaSenhaTextField.text != ""{
            return true
        }else{
            self.novaSenhaTextField.layer.borderColor = UIColor.red.cgColor
            return false
        }
    }
    
    func validarConfirmarNovaSenha() -> Bool{
        if self.confirmarNovaSenha.text != ""{
            return true
        }else{
            self.confirmarNovaSenha.layer.borderColor = UIColor.red.cgColor
            return false
        }
    }
    
}

extension ConfirmarSenhaViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        novaSenhaTextField.layer.borderColor = UIColor.blue.cgColor
        confirmarNovaSenha.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        novaSenhaTextField.resignFirstResponder()
        validarNovaSenha()
        confirmarNovaSenha.resignFirstResponder()
        habilitarBotaoConfirmar()
        
        return validarConfirmarNovaSenha()
    }
}

