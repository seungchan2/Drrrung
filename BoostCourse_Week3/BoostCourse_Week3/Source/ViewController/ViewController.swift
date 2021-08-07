//
//  ViewController.swift
//  BoostCourse_Week3
//
//  Created by 김승찬 on 2021/08/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        // Do any additional setup after loading the view.
    }

    private func registerXib() {
        let nibName = UINib(nibName: "CountryTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "countryCell")
    }

}

