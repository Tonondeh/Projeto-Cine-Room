//
//  PerfilViewController.swift
//  Cine Room
//
//  Created by Danilo Uvara de Souza on 18/02/21.
//

import UIKit
import Foundation

class PerfilViewController: UIViewController {
    
    
    @IBOutlet weak var perfilImageView: UIImageView!
    @IBOutlet weak var nomeUsuarioLabel: UILabel!
    @IBOutlet weak var nomeCompletoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var dataNascimentoLabel: UILabel!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var nomeCompletoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var nascimentoDataPicker: UIDatePicker!
    @IBOutlet weak var editarButton: UIButton!
    @IBOutlet weak var mudarFotoButton: UIButton!
    @IBOutlet weak var salvarButton: UIButton!
    
    
    
    var imagePicker:UIImagePickerController = UIImagePickerController()
    
    var controller = PerfilController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTextField()
        self.configImagePicker()
        self.salvarButton.layer.cornerRadius = 5
        self.unlockTextfield(block: true)
        self.configImageView()
        self.controller.loadUserDefault()
        
        // Povoar Text Fields com Coredata
        
        let user = self.controller.getUser()
    
        
        self.nomeTextField.text = user?.nameDisplay
        self.nomeCompletoTextField.text = user?.nameFull
        self.emailTextField.text = user?.email
        self.cpfTextField.text = "\(user?.cpf)"
        
     
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @IBAction func tappedLogOutButton(_ sender: UIButton) {
        
        self.controller.logOut()
        
        performSegue(withIdentifier: "voltarLogin", sender: nil)
        
    }
    
    
    
    func unlockTextfield (block:Bool) {
        if block == true{
            self.nomeTextField.isEnabled = false
            self.nomeCompletoTextField.isEnabled = false
            self.emailTextField.isEnabled = false
            self.cpfTextField.isEnabled = false
            self.nascimentoDataPicker.isEnabled = false
            self.mudarFotoButton.isHidden = true
            self.salvarButton.isHidden = true
            
        } else {
            self.nomeTextField.isEnabled = true
            self.nomeCompletoTextField.isEnabled = true
            self.emailTextField.isEnabled = false
            self.cpfTextField.isEnabled = true
            self.nascimentoDataPicker.isEnabled = true
            self.mudarFotoButton.isHidden = false
            self.salvarButton.isHidden = false
        }
        
    }
    
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                
                //let campoTextField = cpfTextField.hasText
                
                if self.cpfTextField.isEditing {
                    self.view.frame.origin.y -= 200
                    print("Entrou em CPF")
                } else if self.nomeCompletoTextField.isEditing{
                    self.view.frame.origin.y -= 200
                    print("Entrou em nome completo")
                } else if self.nomeTextField.isEditing{
                    self.view.frame.origin.y -= 100
                    print("Entrou em nome")
                } else {
                    self.view.frame.origin.y -= keyboardSize.height
                }
                
                
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
            
            
        }
        
        
        
    }
    
    func configImagePicker(){
        self.imagePicker.delegate = self
    }
    
    func configImageView(){
        self.perfilImageView.backgroundColor = .lightGray
        self.perfilImageView.tintColor = .darkGray
        self.perfilImageView.layer.cornerRadius = self.perfilImageView.frame.height/2
        self.perfilImageView.image = UIImage(systemName: "person.circle")
        self.perfilImageView.contentMode = .scaleToFill
      
        
    }
    
    func configTextField(){
        self.emailTextField.delegate = self
        self.nomeTextField.delegate = self
        self.nomeCompletoTextField.delegate = self
        self.cpfTextField.delegate = self
        self.cpfTextField.keyboardType = .decimalPad
        self.cpfTextField.inputAccessoryView = self.cpfTextField.inputToolbar()
        
    }
    
    
    
    
    @IBAction func editPerfilTappedButton(_ sender: UIButton) {
        self.unlockTextfield(block: false)
        
        
        
    }
    
    @IBAction func salvarTappedButton(_ sender: UIButton) {
//        self.mudarFotoButton.isHidden = true
//        self.salvarButton.isHidden = true
        
        self.unlockTextfield(block: true)
//
//        self.nomeTextField.isEnabled = false
//        self.nomeCompletoTextField.isEnabled = false
//        self.cpfTextField.isEnabled = false
//        self.nascimentoDataPicker.isEnabled = false
//
        
        
        
        
    }
    
    @IBAction func editPhotoTappedButton(_ sender: UIButton) {
        self.imagePicker.sourceType = .photoLibrary
        self.present(self.imagePicker, animated: true, completion: nil)
        
    }
    
    
    
}

extension PerfilViewController: UITextFieldDelegate {
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        
        let nextTag = textField.tag + 1
       
               if let nextResponder = textField.superview?.viewWithTag(nextTag) {
                   nextResponder.becomeFirstResponder()
               } else {
                   textField.resignFirstResponder()
               }
       
               return false
           }
        

    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var appendString = ""
        
        
        if textField == cpfTextField {
            
            if range.length == 0 {
                switch range.location {
                case 3:
                    appendString = "."
                case 7:
                    appendString = "."
                case 11:
                    appendString = "-"
                default:
                    break
                }
            }
            
            textField.text?.append(appendString)
            
            if (textField.text?.count ?? 0) > 13 && range.length == 0 {
                
                return false
                
                
            }
        }
        return true
    }
    
}


extension PerfilViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        self.perfilImageView.image = imagemRecuperada ?? UIImage()
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
}







    
    












