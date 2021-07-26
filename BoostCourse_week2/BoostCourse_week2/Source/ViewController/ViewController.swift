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
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignUpFistViewContoller") as? SignUpFirstViewController else { return }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    

}

