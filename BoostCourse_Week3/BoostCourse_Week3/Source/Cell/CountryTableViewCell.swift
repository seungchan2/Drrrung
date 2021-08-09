//
//  CountryTableViewCell.swift
//  BoostCourse_Week3
//
//  Created by 김승찬 on 2021/08/07.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    // MARK: Property
    
    static let identifier: String = "CountryTableViewCell"

    // MARK: @IBOutlet
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func touchNextPageButton(_ sender: Any) {
    

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: Function
    
    func setData(imageName: String, title: String) {
        if let image = UIImage(named: imageName)
        {
            countryImageView.image = image
        }
        countryNameLabel.text = title
        
    }
    
}
