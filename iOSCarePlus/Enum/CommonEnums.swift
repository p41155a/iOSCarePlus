//
//  CommonEnums.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2021/01/18.
//

import UIKit

enum GameAPILink {
    case sale
    case new
    
    var URL: String {
        switch self {
        case .sale:
            return "https://ec.nintendo.com/api/KR/ko/search/sales"
        case .new:
            return "https://ec.nintendo.com/api/KR/ko/search/new"
        }
    }
}
