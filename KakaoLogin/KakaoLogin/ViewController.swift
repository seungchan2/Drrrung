//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 김승찬 on 2021/08/21.
//

import UIKit
import KakaoSDKUser


class ViewController: UIViewController {
    @IBOutlet weak var kakaoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginKakao()
        setGesture()
        
    }
    
    private func setGesture() {
        let kakaoLogin = UITapGestureRecognizer(target: self, action: #selector(loginKakao))
        kakaoImage.isUserInteractionEnabled = true
        kakaoImage.addGestureRecognizer(kakaoLogin)
    }
    
    private func getUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
            }
            
        }
    }
    
    @objc func loginKakao() {
        print("loginKakao() called.")
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    _ = oauthToken
            
                self.getUserInfo()
                }
            }
        }

        else {
            print("카카오톡 미설치")
        }
    }
}

