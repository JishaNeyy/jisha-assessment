//
//  ContentView.swift
//  MangaChart
//
//  Created by James Bond on 16/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            
            NavigationLink {
                TopMangaScene()
            } label: {
                Text("Start now")
            }
        }
    }
}

#Preview {
    ContentView()
}
