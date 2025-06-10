//
//  Favorites.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 30.07.24.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favourites: Favourites
    @ObservedObject var viewModel: PhotosViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                PhotoGridView(photos: viewModel.favPhotos)
            }
            .navigationTitle("Favourites")
            .padding()
            .onAppear {
                viewModel.getFavPhotos()
            }
        }
    }
}

#Preview {
    FavouritesView(viewModel: PhotosViewModel())
}
