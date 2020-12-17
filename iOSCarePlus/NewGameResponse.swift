//
//  NewGameResponse.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2020/12/16.
//

import Foundation

struct NewGameResponse: Decodable {
    let contents: [NewGameContent]
    let length: Int
    let offset: Int
    let total: Int
}

struct NewGameContent: Decodable {
    let formalName: String
    let heroBannerURL: String
    let id: Int
//    let screenshots: []
    
    enum CodingKeys: String, CodingKey {
        case formalName = "formal_name"
        case heroBannerURL = "hero_banner_url"
        case id
    }
}
