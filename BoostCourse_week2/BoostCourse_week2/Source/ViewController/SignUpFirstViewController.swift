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
        passwordStrongPasswordError()
        
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
    
    // StrongPassword Error 해결
    //  oneTimeCode -> iOS12에서 추가된 타입으로 문자인증이나 본인인증을 할때 사용하는 일회성 인증코드같은 타입
    //  타입은 키체인에 저장할 필요가 없으므로 secure 타입이면서 키보드가 제대로 표시된다.

    private func passwordStrongPasswordError() {
        if #available(iOS 12.0, *) {
            passwordTextField.textContentType = .oneTimeCode
        }
    }
    
    private func assignDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
        informationTextView.delegate = self
    }
    
    func textFieldConfirm() -> Bool {
        if idTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false && checkPasswordTextField.text?.isEmpty == false {
            print("textFieldConfirm")
            if passwordTextField.text == checkPasswordTextField.text {
                print("password ggg")
                return true
            } else {
                nextPageButton.isSelected = false
                return false
            }
        } else {
            nextPageButton.isSelected = false
            return false
        }
    }
    
    func textViewConfirm() -> Bool {
        if informationTextView.text?.isEmpty == false {
            return true
        } else {
            return false
        }
    }
    
    func imageViewConfirm(_ personImageView: UIImageView) -> Bool {
        if personImageView.image != nil {
            return true
        } else {
            nextPageButton.isSelected = false
            return false
        }
    }
    
    func confirmData() {
        if textFieldConfirm() == true && textViewConfirm() == true && imageViewConfirm(personImageView) == true {
            UserInformation.shared.id = idTextField.text
            UserInformation.shared.password = checkPasswordTextField.text
            nextPageButton.isSelected = true
            nextPageButton.setTitleColor(.systemBlue, for: UIControl.State.normal)
        } else {
            nextPageButton.isSelected = false
        }
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
        confirmData()
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
}
//Mark: - Extension

extension SignUpFirstViewController: UITextFieldDelegate {
    /// Delegate 패턴을 이용하여 textField가 return 버튼이 눌릴때마다 FirstResponder가 idTextField -> passwordTextField -> checkPasswordTextField -> mainTextView 순으로 넘어가며 confirmDatas 메소드를 실행
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           
        if idTextField.isFirstResponder == true{
            passwordTextField.becomeFirstResponder()
            confirmData()
        } else if passwordTextField.isFirstResponder == true {
            checkPasswordTextField.becomeFirstResponder()
            confirmData()
        } else if checkPasswordTextField.isFirstResponder == true {
            informationTextView.becomeFirstResponder()
            confirmData()
        }
        confirmData()
        return true

       }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        confirmData()
    
}
}

extension SignUpFirstViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        print("aa")
        confirmData()

    }
      
    }
    
