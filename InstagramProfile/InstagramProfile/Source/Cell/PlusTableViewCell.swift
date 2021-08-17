//
//  PlusTableViewCell.swift
//  InstagramProfile
//
//  Created by 김승찬 on 2021/08/17.
//

import UIKit

class PlusTableViewCell: UITableViewCell {
    
    static let identifier: String = "PlusTableViewCell"

    @IBOutlet weak var plusImageView: UIImageView!
    @IBOutlet weak var plusLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func plusData(imageName: String, title: String) {
        if let image = UIImage(named: imageName)
        {
            plusImageView.image = image
        }
        plusLabel.text = title
    }
    
}
