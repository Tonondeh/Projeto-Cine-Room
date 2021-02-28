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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTextField()
        
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
        print("Confirmar")
    }
    
}

extension ConfirmarSenhaViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
    }
}
