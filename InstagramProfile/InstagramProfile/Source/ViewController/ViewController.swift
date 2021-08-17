//
//  ViewController.swift
//  InstagramProfile
//
//  Created by 김승찬 on 2021/08/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    @IBAction func touchMakeButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: Const.Storyboard.Name.plus) as? PlusViewController else {return}
        self.present(nextVC, animated: true, completion: nil)
        
    }
    @IBAction func touchListButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: Const.Storyboard.Name.list) as? ListViewController else {return}
        
        self.present(nextVC, animated: true, completion: nil)
    }
    

}

