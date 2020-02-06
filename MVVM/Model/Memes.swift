//
//  Memes.swift
//  MVVM
//
//  Created by Alan Silva on 04/11/19.
//  Copyright © 2019 Alan Silva. All rights reserved.
//

import Foundation

struct Result: Codable {
    let success: Bool
    let data: Data
}

struct Data: Codable {
    let memes: [Meme]
}

struct Meme: Codable {
    let id, name: String
    let url: String
    let width, height, boxCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}
