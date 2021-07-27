//
//  SignUpFirstViewController.swift
//  BoostCourse_week2
//
//  Created by 김승찬 on 2021/07/28.
//

import UIKit
import Foundation

class SignUpFirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var personImageView: UIImageView!
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        pickImage()

      
    }
    
    @objc func pickImage() {
        self.present(self.imagePicker, animated: true)
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

