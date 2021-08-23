//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 김승찬 on 2021/08/21.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon


class ViewController: UIViewController {
    @IBOutlet weak var kakaoLoginImage: UIImageView!
    @IBOutlet weak var kakaoAccountImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginKakao()
        setGesture()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        // 로그인 필요
                    }
                    else {
                        // 기타 에러
                    }
                }
                else {
                    // 토큰 유효성 체크 성공 (필요 시 토큰 갱신됨)
                    self.getUserInfo()
                }
            }
        }
        else {
            // 로그인 필요
        }
    }
    
    // KakaoImage TapGesture
    private func setGesture() {
        let kakaoLogin = UITapGestureRecognizer(target: self, action: #selector(loginKakao))
        kakaoLoginImage.isUserInteractionEnabled = true
        kakaoLoginImage.addGestureRecognizer(kakaoLogin)
        
        let kakaoAccountLogin = UITapGestureRecognizer(target: self, action: #selector(loginKakaoAccount))
        kakaoAccountImage.isUserInteractionEnabled = true
        kakaoAccountImage.addGestureRecognizer(kakaoAccountLogin)
    }
    
    private func getUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                let nickname = user?.kakaoAccount?.profile?.nickname
                let email = user?.kakaoAccount?.email
                
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as? LogoutViewController else { return }
                
                // ✅ 사용자 정보 넘기기
                nextVC.nickname = nickname
                nextVC.email = email
                self.navigationController?.pushViewController(nextVC, animated: true)
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
                    //                    _ = oauthToken
                    
                    self.getUserInfo()
                }
            }
        }
        
        else {
            print("카카오톡 미설치")
        }
    }
    
    @objc func loginKakaoAccount() {
        print("loginKakaoAccount() called.")
        
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                self.getUserInfo()
            }
        }
        
    }
}

