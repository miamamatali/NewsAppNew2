//
//  Model.swift
//  NewsAppNew2
//
//  Created by Indira on 30/3/23.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newsData = try? JSONDecoder().decode(NewsData.self, from: jsonData)

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let content: String
}

