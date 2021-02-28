//
//  LoginViewController.swift
//  Cine Room
//
//  Created by Lucas Munho on 23/02/21.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
        
    }
    
    func configTextField(){
        self.emailtextField.delegate = self
        self.senhaTextField.delegate = self
    }
    
    func validarEntrada() -> Bool{
        let email = emailtextField.text ?? ""
        let senha = senhaTextField.text ?? ""
        var dadosOk = true
        
        // Validacao Email
        
        if email == "" {
            dadosOk = false
            self.emailtextField.layer.borderWidth = 1.5
            self.emailtextField.layer.borderColor = UIColor.red.cgColor
        }else{
            let arrayemailCompleto = email.components(separatedBy: "@")
            print(arrayemailCompleto)
            if arrayemailCompleto.count != 2{
                self.emailtextField.layer.borderWidth = 1.5
                self.emailtextField.layer.borderColor = UIColor.red.cgColor
                dadosOk = false
            }else{
                if arrayemailCompleto[1] == ""{
                    self.emailtextField.layer.borderWidth = 1.5
                    self.emailtextField.layer.borderColor = UIColor.red.cgColor
                    dadosOk = false
                }
            }
            
        }
        
        // Validacao de senha
        
        if senha == "" || senha.count <= 4{
            dadosOk = false
            self.senhaTextField.layer.borderWidth = 1.5
            self.senhaTextField.layer.borderColor = UIColor.red.cgColor
            
        }
        return dadosOk
    }
    
    @IBAction func tappedConectar(_ sender: UIButton) {
        // Chamada de Func validar entrada
        if validarEntrada(){
            print("chamar tela conectar")
        }
        
        
    }
    
    @IBAction func tappedCriarConta(_ sender: UIButton) {
        print("chamar tela criar conta")
    }
    
    @IBAction func tappedEsqueceuSenha(_ sender: UIButton) {
        print("chamar tela esqueceu senha")
    }
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = nil
    }
    
}

