//
//  Define.swift
//  GHIndoorPosition
//
//  Created by MCLAB on 2018/1/18.
//  Copyright © 2018年 MCLAB. All rights reserved.
//

import Foundation
import UIKit
// 後端回傳資料的key值

// MARK: 網址
let REALTIME_API = "http://140.134.27.222:7878/cgi-bin/vilsnodes.lua"
let HISTORY_API = "http://140.134.25.56:8080/api/GetPosition"
let MCLAB_API = "http://140.134.25.59/cgi-bin/vilscgi?action=vilsnodes"
var USER_API = ""

// MARK: db KEY defined
let LOGIN_ACCOUNT_KEY = "loginAccount"
let LOGIN_PASSWORD_KEY = "loginPassword"


// MARK: db signUp Key defined 之前註冊用 現在用不到
let SIGNUP_NAME_KEY = "registerName"
let SIGNUP_GENDE_KEY = "registerGender"
let SIGNUP_BLOOD_KEY = "registerBloodType"
let SIGNUP_PHONE_KEY = "registerContactNumber"
let SIGNUP_BIRTH_KEY = "registerBirthday"
let SIGNUP_ACCOUNT_KEY = "registerAccount"
let SIGNUP_PASSWORD_KEY = "registerPassword"


// MARK: Userdefault Defined Keys
let LOGIN_KEY_USERDEFAULT_KEY = "Accounts"
let GET_IMAGE_KEY = "image"
let ALARM_CLOCK_TIME_KEY = "alarmClock"
let ALARM_STATUS_KEY = "switchStatus"
let PROFILE_PHOTO_KEY = "profileImage"

// MARK : - TAG API JSON 資訊格式

// MARK : - TAG COLOR SET
let TAG_COLOR_SET : [(CGColor)] = [ (UIColor.red.cgColor),(UIColor.blue.cgColor),(UIColor.brown.cgColor), (UIColor.gray.cgColor), (UIColor.green.cgColor), (UIColor.orange.cgColor), (UIColor.purple.cgColor)]
