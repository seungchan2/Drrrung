//
//  MainCollectionViewCell.swift
//  InstagramProfile
//
//  Created by 김승찬 on 2021/08/17.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "MainCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
 
    }
    @IBAction func touchProfileButton(_ sender: Any) {
        print("프로필 편집")
    }
    @IBAction func touchAdvertiseButton(_ sender: Any) {
        print("광고 도구")
    }
    @IBAction func touchInsightButton(_ sender: Any) {
        print("인사이트")
    }
    
}
