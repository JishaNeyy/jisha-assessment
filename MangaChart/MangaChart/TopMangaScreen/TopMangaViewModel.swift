//
//  TopMangaViewModel.swift
//  MangaChart
//
//  Created by James Bond on 16/04/24.
//

import Foundation
import Combine

@MainActor
class TopMangaViewModel: ObservableObject {
    
    private var mangaResponse: MangaResponse? {
        didSet {
            if let mangas = mangaResponse?.data {
                let _mangas = mangas.sorted {
                    $0.rank < $1.rank
                }
                self.mangas = Array(_mangas.prefix(20))
            } else {
                self.mangas = []
            }
        }
    }
    
    @Published var mangas: [Manga] = []
    @Published var fetchInProgress = false
    private let mangaService: MangaServicing
    var cancellables = Set<AnyCancellable>()
    
    init(service: MangaServicing) {
        self.mangaService = service
    }
    
    func fetchTitles() {
        self.fetchInProgress = true
        self.mangaService.fetchMangas().sink { response in
            print("")
        } receiveValue: { response in
            self.mangaResponse = response
        }.store(in: &cancellables)

    }
}
