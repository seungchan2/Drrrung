//
//  PlusViewController.swift
//  InstagramProfile
//
//  Created by 김승찬 on 2021/08/17.
//

import UIKit

class PlusViewController: UIViewController {
    
    //MARK : Property
    var plusList : [PlusList] = []

    //MARK: @IBOutlet
    @IBOutlet weak var plusTableView: UITableView!
    
    //MARK: LifeCycle
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegate()
        registerXib()
        setPlusList()
        plusTableViewAttribute()
    }
    
    //MARK: Functions
    private func assignDelegate() {
        plusTableView.delegate = self
        plusTableView.dataSource = self
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: Const.Xib.Name.PlusTableViewCell, bundle: nil)
        plusTableView.register(nibName, forCellReuseIdentifier: Const.Xib.Name.PlusTableViewCell)
    }
    
    func setPlusList() {
        plusList.append(contentsOf: [PlusList(imageName: "", title: "게시물"), PlusList(imageName: "", title: "릴스"),PlusList(imageName: "", title: "스토리"), PlusList(imageName: "", title: "스토리 하이라이트"), PlusList(imageName: "", title: "라이브 방송"), PlusList(imageName: "", title: "가이드")
        ])
    }
    
    func plusTableViewAttribute() {
        plusTableView.separatorColor = .gray
    }
    
}

    //MARK: Extension

extension PlusViewController: UITableViewDelegate {
    
}

extension PlusViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = plusTableView.dequeueReusableCell(withIdentifier: PlusTableViewCell.identifier, for: indexPath) as? PlusTableViewCell else {return UITableViewCell() }
      
        cell.plusData(imageName: plusList[indexPath.row].imageName, title: plusList[indexPath.row].title)
        
        return cell

    }
    
    
    
    
}
