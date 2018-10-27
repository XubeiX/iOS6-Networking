//
//  Constants.swift
//  Stalk
//
//  Created by Artur on 24/10/2018.
//  Copyright © 2018 Artur. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//MARK: Segues
let TO_LOGIN_SEGUE = "toLoginVC"
let TO_CREATE_ACCOUNT_SEGUE = "toCreateAccountVC"
let UNWIND_TO_CHANNEL_SEGUE = "unwindToChannelVC"

//MARK: User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "user-email"

//MARK: URL Constans
let BASE_URL = "http://stalk-chat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//MARK: Headers
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]
