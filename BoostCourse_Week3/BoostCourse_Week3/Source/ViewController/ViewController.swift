//
//  ViewController.swift
//  BoostCourse_Week3
//
//  Created by 김승찬 on 2021/08/07.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Property
    
    var countryList : [CountryList] = []
    
    //MARK: -Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        navigationItemSetting()
        setCountryList()
        assignDelegate()
    }
    
    //MARK: - Functions
    
    func navigationItemSetting() {
        self.view.backgroundColor = .red
        self.navigationItem.title = "세계 날씨"
        let rightButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(pressButton(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }

    
    private func registerXib() {
        let nibName = UINib(nibName: Const.Xib.Name.CountryTableViewCell, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: Const.Xib.Name.CountryTableViewCell)
    }
    
    func setCountryList()
    {
        countryList.append(contentsOf: [
                            CountryList(iconImageName: "flag_kr", title: "한국"),
                            CountryList(iconImageName: "flag_de", title: "독일"),
                            CountryList(iconImageName: "flag_it", title: "이탈리아"),
                            CountryList(iconImageName: "flag_us", title: "미국"),
                            CountryList(iconImageName: "flag_fr", title: "프랑스"),
                            CountryList(iconImageName: "flag_jp", title: "일본")])
    }
    
    private func assignDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    // MARK: - @IBAction
    
    @IBAction func pressButton(_ sender: UIBarButtonItem){
        let weatherView = WeatherViewController()
        self.navigationController?.pushViewController(weatherView, animated: true)
    }
}

//MARK: - Extension

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let countryCell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier, for: indexPath) as? CountryTableViewCell else {return UITableViewCell() }
        
        countryCell.setData(imageName: countryList[indexPath.row].iconImageName, title: countryList[indexPath.row].title)
        
        return countryCell
        
    }
    
}
