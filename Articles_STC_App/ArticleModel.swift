//
//  ArticleModel.swift
//  mytestinghere
//
//  Created by Hadeel Almushigih on 9/18/18.
//  Copyright © 2018 HALMUSHIGIH. All rights reserved.
//

import Foundation

struct URLResponse: Decodable {
    let title: String?
    let articles: [Articles]?
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case articles = "articles"
    }
}
struct Articles: Decodable {
    let website: String?
    let authors: String?
    let content: String?
    let date: String?
    let image_url: String?
    let tags: [Tags]?
    let title: String?
}
struct Tags: Decodable {
    let id: Int?
    let label: String?
}
