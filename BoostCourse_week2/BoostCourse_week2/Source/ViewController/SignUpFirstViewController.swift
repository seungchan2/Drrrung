//
//  SignUpFirstViewController.swift
//  BoostCourse_week2
//
//  Created by 김승찬 on 2021/07/28.
//

import UIKit


class SignUpFirstViewController: UIViewController {
    
    // MARK: - @IBOutlet Property
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var informationTextView: UITextView!
    
    // MARK: - Property
    
    let imagePicker = UIImagePickerController()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickImage()
        imagePickerAttribute()
        assignDelegate()
    }
    
    @IBAction func touchNextButton(_ sender: Any) {
        
        let signupSecondStoryboard = UIStoryboard(name: Const.Storyboard.Name.signUpSecond, bundle: nil)
      
        guard let signUpSecondViewController = signupSecondStoryboard.instantiateViewController(withIdentifier: Const.ViewController.identifier.signUpSecond) as? SignUpSecondViewController else { return }
     
        self.navigationController?.pushViewController(signUpSecondViewController, animated: true)
    }
    
    // MARK: - Functions
    
    @objc func pickImage() {
        self.present(self.imagePicker, animated: true)
    }
    
    private func imagePickerAttribute() {
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String: Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
            self.personImageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    private func assignDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
    }
    
}

// MARK: - Extension

extension SignUpFirstViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var newImage: UIImage? = nil
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }
        self.personImageView.image = newImage
        picker.dismiss(animated: true, completion: nil)
    }
    
}
    //Mark: - Extension

extension SignUpFirstViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if idTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false && checkPasswordTextField.text?.isEmpty == false {
            
            nextPageButton.isEnabled = true
            if passwordTextField.text == checkPasswordTextField.text {
                nextPageButton.isEnabled = true
            } else {
                nextPageButton.isEnabled = false
            }
        } else {
            nextPageButton.isEnabled = false
        }
    }
    
}
