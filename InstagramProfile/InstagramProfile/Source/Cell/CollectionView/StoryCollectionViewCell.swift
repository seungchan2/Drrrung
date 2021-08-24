//
//  StoryCollectionViewCell.swift
//  InstagramProfile
//
//  Created by 김승찬 on 2021/08/18.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCollectionViewCell"


    @IBOutlet weak var storyImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

    func storyData(imageName: String) {
        if let image = UIImage(named: imageName)
        {
            storyImage.image = image
        }
    }
}
