//
//  ContentView.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 30.07.24.
//

import SwiftUI
import Nuke
import NukeUI

struct PhotosView: View {
    
    @EnvironmentObject var viewModel: PhotosViewModel
    @State private var navPath = NavigationPath()
    
    var body: some View {
        NavigationView {
            ScrollView {
                PhotoGridView(photos: viewModel.photos)
            }
            .navigationTitle("Photos")
        }
        .padding()
        .onAppear {
            if viewModel.photos.count < 1 {
                viewModel.getPhotos()
            }
        }
    }
}

//#Preview {
//    PhotosView(viewModel: PhotosViewModel())
//}
