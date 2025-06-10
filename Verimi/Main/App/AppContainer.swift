//
//  AppContainer.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 30.07.24.
//

import SwiftUI

struct AppContainer: View {
    var body: some View {
        @ObservedObject var viewModel = PhotosViewModel()
        
        TabView {
            PhotosView()
                .tabItem {
                    Label("Photos", systemImage: "photo.stack")
                }
            
            FavouritesView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star.square.on.square")
                }
        }
        .environmentObject(viewModel)
    }
}

class Favourites: ObservableObject {
    @Published var favourites = [Photo]()
}
