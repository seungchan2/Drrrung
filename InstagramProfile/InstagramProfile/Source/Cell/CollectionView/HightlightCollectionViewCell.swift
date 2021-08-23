//
//  HightlightCollectionViewCell.swift
//  InstagramProfile
//
//  Created by 김승찬 on 2021/08/18.
//

import UIKit

class HightlightCollectionViewCell: UICollectionViewCell {
    
    //MARK: -Property
    
    static let identifier: String = "HightlightCollectionViewCell"
    var imageList : [ImageList] = []
    var isOpened: Bool = false
    
    //MARK: @IBOutlets
    
    @IBOutlet weak var hightlightView: UIView!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    //MARK: LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setImageList()
    }
    
    //MARK: Functions
    
  
    func setImageList() {
        imageList.append(contentsOf: [ImageList(imageName: "Circle"), ImageList(imageName: "Circle"), ImageList(imageName: "Circle"), ImageList(imageName: "Circle"), ImageList(imageName: "Circle"), ImageList(imageName: "Circle")
        ])
    }
    
    func open() {
        print("open")
        arrowImageView.transform = CGAffineTransform(rotationAngle: .pi)
    
        self.hightlightView.layoutIfNeeded()
        isOpened = true
    }

    func close() {
        print("close")
        arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
        self.hightlightView.layoutIfNeeded()
        isOpened = false

    }
    
    //MARK: @IBAction
    
    @IBAction func seeBottomViewButton(_ sender: Any) {
        
//        UIView.animate(withDuration: 0.5) {
//            if self.isOpened{
//                self.close()
//            } else {
//                self.open()
//            }
//        }
    }
}

//MARK: Extensions

//extension HightlightCollectionViewCell: UICollectionViewDelegate {
//
//}
//
//extension HightlightCollectionViewCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imageList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        var cell = UICollectionViewCell()
//
//        cell = hightlightCollectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
//
//        return cell
//    }
//}
//
//extension HightlightCollectionViewCell: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = UIScreen.main.bounds.width
//
//        let cellwidth = 50
//        let cellheight = 50
//
//        return CGSize(width: cellwidth, height: cellheight)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 3
//    }
//}

