//
//  PerfilViewController.swift
//  Cine Room
//
//  Created by Danilo Uvara de Souza on 18/02/21.
//

import UIKit
import Foundation

class PerfilViewController: UIViewController {
	
	// MARK: - IBOutlet
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
	
	// MARK: - Variable
	private let imagePicker: UIImagePickerController = UIImagePickerController()
	private let controller = PerfilController()
	private var user: UserModel?
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configTextField()
		self.getDataUser()
		self.configImagePicker()
        self.salvarButton.layer.cornerRadius = ButtonEdges.corner.rawValue
		self.unlockTextfield(block: true)
		self.configImageView()
		self.configNotificationCenter()
	}
	
	
	// MARK: - Function
	private func unlockTextfield (block:Bool) {
		
		if block {
			self.nomeTextField.isEnabled = false
			self.nomeTextField.backgroundColor = .lightGray
			self.nomeCompletoTextField.isEnabled = false
			self.nomeCompletoTextField.backgroundColor = .lightGray
			self.emailTextField.isEnabled = false
			self.cpfTextField.isEnabled = false
			self.cpfTextField.backgroundColor = .lightGray
			self.nascimentoDataPicker.isEnabled = false
			self.mudarFotoButton.isHidden = true
			self.salvarButton.isHidden = true
		} else {
			self.nomeTextField.isEnabled = true
			self.nomeTextField.backgroundColor = .white
			self.nomeCompletoTextField.isEnabled = true
			self.nomeCompletoTextField.backgroundColor = .white
			self.emailTextField.isEnabled = false
			self.cpfTextField.isEnabled = true
			self.cpfTextField.backgroundColor = .white
			self.nascimentoDataPicker.isEnabled = true
			self.mudarFotoButton.isHidden = false
			self.salvarButton.isHidden = false
		}
		
	}
	
	private func configNotificationCenter() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
															name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
															name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	private func getDataUser() {
		// Carrega os dados do Usuario
		self.controller.loadUserDefault()
		
		// Obtem os dados do Usuario
		user = self.controller.getUser()
		
		// Preenche os dados do Usuario nos TextField
		self.nomeTextField.text = user?.nameDisplay
		self.nomeCompletoTextField.text = user?.nameFull
		self.emailTextField.text = user?.email
		
		// Tratar o CPF
		if let cpf = user?.cpf {
			var characters = Array(String(cpf))
			
			if characters.count == 11 {
				characters.insert(".", at: 3)
				characters.insert(".", at: 7)
				characters.insert("-", at: 11)
				let masked = String(characters)
				print("cpf masked: ",masked)
				self.cpfTextField.text = masked
			} else {
				print("CPF incorreto")
			}
			
		}
		
		// TODO: Tratar Data Nascimento
		self.nascimentoDataPicker.date = user?.dateBirth ?? Date()
	}
	
	@objc func keyboardWillShow(notification: NSNotification) {
		
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			if self.view.frame.origin.y == 0 {
				if self.cpfTextField.isEditing {
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
	
	func configImagePicker() {
		self.imagePicker.delegate = self
	}
	
	func configImageView() {
		self.perfilImageView.backgroundColor = .lightGray
		self.perfilImageView.tintColor = .darkGray
		self.perfilImageView.layer.cornerRadius = self.perfilImageView.frame.height/2
		self.perfilImageView.image = UIImage(systemName: "person.circle")
		self.perfilImageView.contentMode = .scaleToFill
	}
	
	func configTextField() {
		self.emailTextField.delegate = self
		self.nomeTextField.delegate = self
		self.nomeCompletoTextField.delegate = self
		self.cpfTextField.delegate = self
		self.cpfTextField.keyboardType = .decimalPad
		self.cpfTextField.inputAccessoryView = self.cpfTextField.inputToolbar()
	}
	
	
	
	// MARK: - IBAction
	@IBAction func tappedLogOutButton(_ sender: UIButton) {
		self.controller.logOut()
		performSegue(withIdentifier: "voltarLogin", sender: nil)
	}
	
	@IBAction func editPerfilTappedButton(_ sender: UIButton) {
		self.unlockTextfield(block: false)
	}
	
	@IBAction func salvarTappedButton(_ sender: UIButton) {
		self.unlockTextfield(block: true)
		
		let cpf = self.cpfTextField.text
		let cpfString = cpf?.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
		let cpfNumber = Int64(cpfString ?? "") ?? 0
		
		let userUpDate: UserModel = UserModel(cpf:  cpfNumber ,
														  dateBirth: self.nascimentoDataPicker.date,
														  email: self.emailTextField.text,
														  nameDisplay: self.nomeTextField.text,
														  nameFull: self.nomeCompletoTextField.text)
		
		if user != userUpDate {
			print("===>> campos diferentes")
			self.controller.updateUser(userUpdate: userUpDate)
		} else {
			print("===>>campos iguais")
		}
		
	}
	
	@IBAction func editPhotoTappedButton(_ sender: UIButton) {
		self.imagePicker.sourceType = .photoLibrary
		self.present(self.imagePicker, animated: true, completion: nil)
	}
	
}


// MARK: - Extension
extension PerfilViewController: UITextFieldDelegate {
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		textField.layer.borderColor = UIColor.blue.cgColor
	}
		
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
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


// MARK: - Extension
extension PerfilViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
		
		self.perfilImageView.image = imagemRecuperada ?? UIImage()
		picker.dismiss(animated: true, completion: nil)
	}
	
}
