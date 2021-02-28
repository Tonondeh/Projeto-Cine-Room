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
    @IBOutlet weak var editarButton: UIBarButtonItem!
    @IBOutlet weak var mudarFotoButton: UIButton!
    @IBOutlet weak var salvarButton: UIButton!
    
    var imagePicker:UIImagePickerController = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mudarFotoButton.isHidden = true
        self.salvarButton.isHidden = true
        self.configTextField()
        self.configImagePicker()
        
        self.salvarButton.layer.cornerRadius = 5
        
        
        self.nomeTextField.isEnabled = false
        self.nomeCompletoTextField.isEnabled = false
        self.emailTextField.isEnabled = false
        self.cpfTextField.isEnabled = false
        self.nascimentoDataPicker.isEnabled = false
        
        
        

    }
    
    func configImagePicker(){
        self.imagePicker.delegate = self
    }
    
    func configTextField(){
        self.emailTextField.delegate = self
        self.nomeTextField.delegate = self
        self.nomeCompletoTextField.delegate = self
        self.cpfTextField.delegate = self
        
        
    }
    
    

    @IBAction func editPerfilTappedButton(_ sender: UIBarButtonItem) {
        self.mudarFotoButton.isHidden = false
        self.salvarButton.isHidden = false
        
        self.nomeTextField.isEnabled = true
        self.nomeCompletoTextField.isEnabled = true
        self.cpfTextField.isEnabled = true
        self.nascimentoDataPicker.isEnabled = true
        
        
    }
    
    @IBAction func salvarTappedButton(_ sender: UIButton) {
        self.mudarFotoButton.isHidden = true
        self.salvarButton.isHidden = true
        
        self.nomeTextField.isEnabled = false
        self.nomeCompletoTextField.isEnabled = false
        self.cpfTextField.isEnabled = false
        self.nascimentoDataPicker.isEnabled = false
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
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}

extension PerfilViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        self.perfilImageView.image = imagemRecuperada ?? UIImage()
        
        picker.dismiss(animated: true, completion: nil)
    }
}


