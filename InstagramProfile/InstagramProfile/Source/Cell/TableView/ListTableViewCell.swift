//
//  ListTableViewCell.swift
//  InstagramProfile
//
//  Created by 김승찬 on 2021/08/17.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let identifier: String = "ListTableViewCell"

    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var listImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func listData(imageName: String, title: String) {
        if let image = UIImage(named: imageName)
        {
            listImageView.image = image
        }
        listLabel.text = title
    }
    
}
