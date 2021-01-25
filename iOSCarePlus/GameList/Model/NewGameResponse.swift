//
//  NewGameResponse.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2020/12/16.
//

import Foundation

struct NewGameResponse: Decodable {
    var contents: [NewGameContent]
    var offset: Int
    var length: Int
    var total: Int
}

struct NewGameContent: Decodable {
    let formalName: String
    let heroBannerURL: String
    let gameId: Int
    let screenshots: [Screenshots]?
    
    enum CodingKeys: String, CodingKey {
        case formalName = "formal_name"
        case heroBannerURL = "hero_banner_url"
        case gameId = "id"
        case screenshots
    }
}

struct Screenshots: Decodable {
    let images: [Images]
}

struct Images: Decodable {
    let url: String
}

// 모든 model 정의
//struct SaleGameResponse: Decodable {
//    var contents: [SaleGameContent]
//    var offset: Int
//    var length: Int
//    var total: Int
//}
//
//struct SaleGameContent: Decodable {
//    let contentType: String
//    let disclaimer: String
//    let dominantColors: [String]
//    let formalName: String
//    let heroBannerUrl: String
//    let gameId: Int
//    let isNew: Bool
//    let membershipRequired: Bool
//    let publicStatus: String
//    let screenshots: [NewGameScreenshots]?
//    let ratingInfo: SaleGameRatingInfo
//    let releaseDateOnEshop: String
//    let tags: [String]
//    let targetTitles: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case disclaimer, screenshots, tags
//        case contentType = "content_type"
//        case dominantColors = "dominant_colors"
//        case formalName = "formal_name"
//        case heroBannerUrl = "hero_banner_url"
//        case isNew = "is_new"
//        case membershipRequired = "membership_required"
//        case publicStatus = "public_status"
//        case ratingInfo = "rating_info"
//        case releaseDateOnEshop = "release_date_on_eshop"
//        case targetTitles = "target_titles"
//        case gameId = "id"
//    }
//}
//
//struct SaleGameScreenshots: Decodable {
//    let images: [NewGameURL]
//}
//
//struct SaleGameURL: Decodable {
//    let url: String
//}
//
//struct SaleGameRatingInfo: Decodable {
//    let contentDescriptors: [SaleGameContentDescriptors]
//    let rating: [SaleGameRating]
//    let ratingSystem: [SaleGameRatingSystem]
//
//    enum CodingKeys: String, CodingKey {
//        case rating
//        case contentDescriptors = "content_descriptors"
//        case ratingSystem = "rating_system"
//    }
//}
//
//struct SaleGameContentDescriptors: Decodable {
//    let id: Int
//    let imageUrl: String
//    let name: String
//    let svgImageUrl: String
//    let type: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, type
//        case imageUrl = "image_url"
//        case svgImageUrl = "svg_image_url"
//    }
//}
//
//struct SaleGameRating: Decodable {
//    let age: Int
//    let id: Int
//    let name: String
//    let provisional: Bool
//    let svgImageUrl: String
//
//    enum CodingKeys: String, CodingKey {
//        case age, id, name, provisional
//        case svgImageUrl = "svg_image_url"
//    }
//}
//
//struct SaleGameRatingSystem: Decodable {
//    let id: Int
//    let name: String
//}
