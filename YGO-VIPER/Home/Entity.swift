//
//  Entity.swift
//  YGO-VIPER
//
//  Created by ddl on 11/03/22.
//

import Foundation

// Model

struct YGOdb: Codable {
    let data: [Data]
}

struct Data: Codable {
    let id: Int
    let name: String
    let type: String
    let desc: String
    let race: String?
    let level: Int?
    let atk: Int?
    let def: Int?
    let attribute: String?
    let archetype: String?
//    let level: String
//    let race: String
//    let attribute: String
//    let archetype: String
    // need to disable identifier name because ambil data dari json nya pakai _
    // swiftlint:disable identifier_name
    let card_images: [CardImages]
}

struct CardImages: Codable {
    let image_url: String
    let image_url_small: String
}
