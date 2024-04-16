//
//  TopMangaScene.swift
//  MangaChart
//
//  Created by James Bond on 16/04/24.
//

import SwiftUI

struct TopMangaScene: View {
    
    @StateObject private var mangaViewModel = TopMangaViewModel(service: MangaService())

    var body: some View {
        List {
            ForEach(mangaViewModel.mangas, id: \.mal_id) { manga in
                NavigationLink {
                    MangaDetailScreen(manga: manga)
                } label: {
                    VStack(alignment: .leading) {
                        Text(manga.title)
                        Text("\(manga.rank)")
                    }
                }
            }
        }
        .listStyle(SidebarListStyle())
        .scrollIndicators(.hidden)
        .navigationTitle("Mangas")
        .onAppear {
            mangaViewModel.fetchTitles()
        }
    }
}

#Preview {
    TopMangaScene()
}
