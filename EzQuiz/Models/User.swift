//
//  User.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 07.06.2022.
//

import Foundation

struct User {
    let login : String?
    let password : String?
}

extension User {
    static var logins = [
        User(login: "seeqmyduck", password: "12345")
    ]
}
