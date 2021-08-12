//
//  PhotoCollectionViewCell.swift
//  BoostCourse_Week4
//
//  Created by 김승찬 on 2021/08/12.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PhotoCollectionViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var mainPhotoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setData(imageName: String, title: String, countText: String) {
        if let image = UIImage(named: imageName)
        {
            mainPhotoImageView.image = image
        }
        nameLabel.text = title
        countLabel.text = countText
    }
    
}
