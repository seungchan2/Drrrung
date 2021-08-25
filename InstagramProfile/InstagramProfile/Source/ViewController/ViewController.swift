//
//  ViewController.swift
//  InstagramProfile
//
//  Created by 김승찬 on 2021/08/16.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: @IBOutlet

    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    //MARK: Property
    
    let refreshControl = UIRefreshControl()
    
    
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        registerNib()
        assignDelegate()
        initRefresh()
    }
    
    //MARK: Functions
    
    func registerXib() {
        let nibName = UINib(nibName: Const.Xib.Name.MainCollectionViewCell, bundle: nil)
        mainCollectionView.register(nibName, forCellWithReuseIdentifier: Const.Xib.Name.MainCollectionViewCell)
      
        let xibName = UINib(nibName: Const.Xib.Name.StoryCollectionViewCell, bundle: nil)
        mainCollectionView.register(xibName, forCellWithReuseIdentifier: Const.Xib.Name.StoryCollectionViewCell)
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
    
    func initRefresh()
    {
        refreshControl.addTarget(self, action: #selector(refreshCollection(refresh:)), for: .valueChanged)
        mainCollectionView.refreshControl = refreshControl
    }
    
    
    
    @objc func refreshCollection(refresh: UIRefreshControl){
        print("새로고침")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.mainCollectionView.reloadData()
            refresh.endRefreshing()
        }
    }
    
    //MARK: @IBAction
    
    @IBAction func touchMakeButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: Const.Storyboard.Name.plus) as? PlusViewController else {return}
        self.present(nextVC, animated: true, completion: nil)
        
    }
    @IBAction func touchListButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: Const.Storyboard.Name.list) as? ListViewController else {return}
        
        self.present(nextVC, animated: true, completion: nil)
    }

}
    //MARK: Extension

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    // section 설정 -> 우선 임의로 설정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
        
    }
    // section 에 따른 셀의 개수 return
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
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
//            if indexPath.row == 0 {
                cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "HightlightCollectionViewCell", for: indexPath) as! HightlightCollectionViewCell
                print("section1")
//
//            }
//            else {
////                cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
//                print("section2")
//
//            }
        } else {
            cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        }
        return cell
    }
    

}
extension ViewController: UICollectionViewDelegateFlowLayout {
//     section의 높이 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
           
            return CGSize(width: mainCollectionView.frame.width, height: mainCollectionView.frame.height/3)
            
        } else if indexPath.section == 1 {
            if HightlightCollectionViewCell.isOpened == false {
                print("2")
                return CGSize(width: 375, height: 100)
                
            } else {
                print("44")
                return CGSize(width: 375, height: 100)
                
            }
            
        }
        else {
            print("라라라")
            return CGSize(width: 375, height: 100)
        }
        
    }
}
