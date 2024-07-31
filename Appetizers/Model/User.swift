//
//  User.swift
//  Appetizers
//
//  Created by Mehul Jain on 31/07/24.
//

import Foundation

struct User:Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
