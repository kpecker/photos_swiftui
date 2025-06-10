//
//  PhotosGridView.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 31.07.24.
//

import SwiftUI

struct PhotoGridView: View {
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var photos: [Photo]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(photos) { photo in
                NavigationLink {
                    PhotoDetailView(photo: photo)
                } label: {
                    if let url = URL(string: photo.downloadUrl) {
                        CachedImageView(url: url)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }.padding(.horizontal)
    }
}

