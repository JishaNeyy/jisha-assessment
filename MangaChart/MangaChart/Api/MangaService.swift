//
//  MangaService.swift
//  MangaChart
//
//  Created by James Bond on 16/04/24.
//

import Foundation
import Combine

class MangaService: MangaServicing {
 
    private let url = URL(string: "https://api.jikan.moe/v4/top/manga")!

    func fetchMangas() -> AnyPublisher<MangaResponse, Error> {
        let request = URLRequest(url: url)
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap({ (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse,
                      (httpResponse.statusCode == 200 && httpResponse.statusCode < 300 ) else {
                    throw URLError(.badServerResponse)
                }
                return data
            })
            .subscribe(on: DispatchQueue.global())
            .decode(type: MangaResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
