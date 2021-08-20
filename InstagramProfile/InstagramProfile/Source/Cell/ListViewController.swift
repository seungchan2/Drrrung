//
//  ListViewController.swift
//  InstagramProfile
//
//  Created by 김승찬 on 2021/08/17.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: Property
    
    var listList : [ListList] = []
    
    //MARK: @IBOutlet
    
    @IBOutlet weak var listTableView: UITableView!
    
    // 터치시 모달창 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegate()
        registerXib() 
        setListList()
        listTableViewAttribute()
    }
    
    //MARK: Functions
    
    private func assignDelegate() {
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: Const.Xib.Name.ListTableViewCell, bundle: nil)
        listTableView.register(nibName, forCellReuseIdentifier: Const.Xib.Name.ListTableViewCell)
        
    }
    
    func setListList() {
        listList.append(contentsOf: [ListList(imageName: "", title: "설정"), ListList(imageName: "", title: "보관"),ListList(imageName: "", title: "내 활동"), ListList(imageName: "", title: "인사이트"), ListList(imageName: "", title: "QR 코드"), ListList(imageName: "", title: "저장됨"), ListList(imageName: "", title: "친한 친구"), ListList(imageName: "", title: "사람 찾아보기"), ListList(imageName: "", title: "코로나19 정보 센터")
        ])
    }
    
    func listTableViewAttribute() {
        listTableView.separatorColor = .gray
    }
    
}

//MARK: Extensions


extension ListViewController: UITableViewDelegate {
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else {return UITableViewCell() }
      
        cell.listData(imageName: listList[indexPath.row].imageName, title: listList[indexPath.row].title)
        
        return cell
    }
    
    
}
