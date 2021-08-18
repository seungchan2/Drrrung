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
        registerXib()
        registerNib()
        assignDelegate()
 
    }
    
    func registerXib() {
        let nibName = UINib(nibName: Const.Xib.Name.MainCollectionViewCell, bundle: nil)
        mainCollectionView.register(nibName, forCellWithReuseIdentifier: Const.Xib.Name.MainCollectionViewCell)
    }
    
    func registerNib() {
        let nibName = UINib(nibName: Const.Xib.Name.HightlightCollectionViewCell, bundle: nil)
        mainCollectionView.register(nibName, forCellWithReuseIdentifier:
                                        Const.Xib.Name.HightlightCollectionViewCell)
    }
    
    func assignDelegate() {
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
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

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    // section 설정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    // section 에 따른 return
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 1
        case 2:
            return 1
            
        default:
            return 1
        }
    }
    
    // section 0,1,2 에 따라서 각 section의 cell return
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if indexPath.section == 0 {
            cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            print("section0")
            // 에러 부분
        } else if indexPath.section == 1 {
            cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "HightlightCollectionViewCell", for: indexPath) as! HightlightCollectionViewCell
            print("section1")
        } else {
        }
        return cell
    }

}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // section의 높이 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: mainCollectionView.frame.width, height: mainCollectionView.frame.height/3)
        } else if indexPath.section == 1 {
            let width = UIScreen.main.bounds.width
            
            let cellwidth = 375
            let cellheight = 137
            
            return CGSize(width: cellwidth, height: cellheight)
            
        } else {
            return CGSize(width: 100, height: 100)
            
        }

        }
        
    }
    
    

