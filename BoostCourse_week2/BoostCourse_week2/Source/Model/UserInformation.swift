//
//  UserInformation.swift
//  BoostCourse_week2
//
//  Created by 김승찬 on 2021/08/04.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var phoneNumber: String?
    var dateOfBirth: String?
    
}
