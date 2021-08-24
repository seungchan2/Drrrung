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
    static var isOpened: Bool = true

    
    //MARK: @IBOutlets
    
    @IBOutlet weak var arrowButton: UIButton!
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
    
    func isOpen() {
        print("open")
        arrowImageView.transform = CGAffineTransform(rotationAngle: .pi)
        self.hightlightView.layoutIfNeeded()
        HightlightCollectionViewCell.isOpened = true
    }

    func isClose() {
        print("close")
        arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
        self.hightlightView.layoutIfNeeded()
        HightlightCollectionViewCell.isOpened = false

    }
    
    //MARK: @IBAction
    
    @IBAction func seeBottomViewButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            if HightlightCollectionViewCell.isOpened == true {
                self.isClose()
            } else {
                self.isOpen()
        
            }
        }
    }
}

