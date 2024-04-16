//
//  Manga.swift
//  MangaChart
//
//  Created by James Bond on 16/04/24.
//

import Foundation

struct MangaResponse: Decodable {
    let data: [Manga]
}

struct MangaImages: Decodable {
    let jpg: MangaImage
}

struct MangaImage: Decodable {
    let image_url: String
    let small_image_url: String
    let large_image_url: String
}

struct Manga: Decodable {
    let mal_id: Int
    let rank: Int
    let title: String
    let status: String
    let synopsis: String
    let url: String
    let images: MangaImages
}
