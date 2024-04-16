//
//  MangaDetailScreen.swift
//  MangaChart
//
//  Created by James Bond on 16/04/24.
//

import SwiftUI

struct MangaDetailScreen: View {
    
    let manga: Manga
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                AsyncImage(url: URL(string: manga.images.jpg.image_url))
                    .clipShape(Circle())
                Text("Status: " + manga.status)
            }
            Text(manga.synopsis)
            let link = "[Link](\(manga.url))"
            Text(.init(link))
            Spacer()
        }
        .padding(20)
        .navigationTitle(manga.title)
    }
}
