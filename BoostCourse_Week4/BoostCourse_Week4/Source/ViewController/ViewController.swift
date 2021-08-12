//
//  ViewController.swift
//  BoostCourse_Week4
//
//  Created by 김승찬 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Property
    
    var mainList : [MainList] = []
    
    // MARK: @IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        assignDelegate()
    }

    // MARK: Functions
    
    private func registerXib() {
        let nibName = UINib(nibName: Const.Xib.Name.PhotoCollectionViewCell, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: Const.Xib.Name.PhotoCollectionViewCell)
    }
    
    private func assignDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setMainList() {
        mainList.append(contentsOf: [MainList(iconImageName: <#T##String#>, title: <#T##String#>, countText: <#T##String#>),
        MainList(iconImageName: <#T##String#>, title: <#T##String#>, countText: <#T##String#>),
        MainList(iconImageName: <#T##String#>, title: <#T##String#>, countText: <#T##String#>)])
    }

}

    // MARK: -CollectionView Extension

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
