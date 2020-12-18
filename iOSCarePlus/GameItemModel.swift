//
//  GameItemModel.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2020/12/16.
//

import Foundation

struct GameItemModel {
    let gameTitle: String
    let gameOriginPrice: Int
    let gameDiscountPrice: Int?
    let screenshots: [NewGameScreenshots]?
//    let id: Int
    
    let imageURL: String
}
