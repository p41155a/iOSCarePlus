//
//  NewGameResponse.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2020/12/16.
//

import Foundation

struct NewGameContent: Decodable {
    let formalName: String
    let heroBannerURL: String
    let gameId: Int
//    let screenshots: []
    
    enum CodingKeys: String, CodingKey {
        case formalName = "formal_name"
        case heroBannerURL = "hero_banner_url"
        case gameId = "id"
    }
}

struct NewGameResponse: Decodable {
    let contents: [NewGameContent]
    let offset: Int
    let length: Int
    let total: Int
}
