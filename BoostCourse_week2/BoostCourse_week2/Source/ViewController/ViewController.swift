//
//  ViewController.swift
//  BoostCourse_week2
//
//  Created by 김승찬 on 2021/07/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchNextButton(_ sender: Any) {
        
        let signupFirstStoryboard = UIStoryboard(name: Const.Storyboard.Name.signUpFirst, bundle: nil)
      
        guard let signUpFirstViewController = signupFirstStoryboard.instantiateViewController(withIdentifier: Const.ViewController.identifier.signUpFirst) as? SignUpFirstViewController else { return }
     
        self.navigationController?.pushViewController(signUpFirstViewController, animated: true)
    }
    

}

