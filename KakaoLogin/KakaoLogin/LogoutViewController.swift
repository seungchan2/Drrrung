//
//  LogoutViewController.swift
//  KakaoLogin
//
//  Created by 김승찬 on 2021/08/21.
//

import UIKit
import KakaoSDKUser

class LogoutViewController: UIViewController {
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var nickname: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func unlinkClicked(_ sender: Any) {
        
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
                
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
extension LogoutViewController {
    private func setUI() {
        
        if let nickname = nickname {
            nicknameLabel.text = "\(nickname)님 환영합니다."
        }
        
        if let emial = email {
            emailLabel.text = "\(emial)님 환영합니다."
        } else {
            emailLabel.text = "이메일 정보 수집을 동의하십시오."
        }
        
        
    }
    
}
