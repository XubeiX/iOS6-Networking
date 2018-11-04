//
//  Constants.swift
//  Stalk
//
//  Created by Artur on 24/10/2018.
//  Copyright © 2018 Artur. All rights reserved.
//

import Foundation
import UIKit

typealias CompletionHandler = (_ Success: Bool) -> ()

//MARK: Segues
let TO_LOGIN_SEGUE = "toLoginVC"
let TO_CREATE_ACCOUNT_SEGUE = "toCreateAccountVC"
let UNWIND_TO_CHANNEL_SEGUE = "unwindToChannelVC"
let TO_AVATAR_PICKER_SEGUE = "toAvatarPickerVC"

//MARK: User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "user-email"

//MARK: URL Constans
let BASE_URL = "http://stalk-chat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"

//MARK: Headers
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]
let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type" : "application/json; charset=utf-8"
]

let stalkPlaceholderColor = #colorLiteral(red: 0.3647058824, green: 0.3952121437, blue: 0.8937282562, alpha: 0.5)

//MARK: Notification Constants
let NOTIFY_USER_DATA_DID_CHANGE = Notification.Name("noptifyUserDataChanged")
