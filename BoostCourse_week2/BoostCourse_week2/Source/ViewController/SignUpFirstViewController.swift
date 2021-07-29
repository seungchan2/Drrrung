//
//  SignUpFirstViewController.swift
//  BoostCourse_week2
//
//  Created by 김승찬 on 2021/07/28.
//

import UIKit
import Foundation

// 주석달기
class SignUpFirstViewController: UIViewController {
    
    @IBOutlet weak var personImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        pickImage()
        imagePickerAttribute()
      
    }
    
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
}

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
