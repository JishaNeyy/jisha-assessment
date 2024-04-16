//
//  MangaServicing.swift
//  MangaChart
//
//  Created by James Bond on 16/04/24.
//

import Foundation
import Combine

protocol MangaServicing {
    
    func fetchMangas() -> AnyPublisher<MangaResponse, Error>
}
