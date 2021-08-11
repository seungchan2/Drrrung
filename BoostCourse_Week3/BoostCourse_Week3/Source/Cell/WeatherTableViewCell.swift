//
//  WeatherTableViewCell.swift
//  BoostCourse_Week3
//
//  Created by 김승찬 on 2021/08/10.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier: String = "WeatherTableViewCell"
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var rainPercentageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
