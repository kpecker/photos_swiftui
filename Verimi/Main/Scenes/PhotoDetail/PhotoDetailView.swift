//
//  PhotoDetailView.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 31.07.24.
//

import SwiftUI
import NukeUI

struct PhotoDetailView: View {
    @State var photo: Photo
    @EnvironmentObject var viewModel: PhotosViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            if let url = URL(string: photo.downloadUrl) {
                CachedImageView(url: url)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding()
            }
        }.navigationTitle(photo.author.capitalizedSentence)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        photo.isFavourite.toggle()
                        viewModel.setFav(photo: photo)
                    } label: {
                        photo.isFavourite ? Image(systemName: "star.fill") : Image(systemName: "star")
                    }
                }
            }
    }
}

#Preview {
    PhotoDetailView(photo: Photo(id: "1", author: "some", url: "https://fastly.picsum.photos/id/1/5000/3333.jpg?hmac=Asv2DU3rA_5D1xSe22xZK47WEAN0wjWeFOhzd13ujW4", downloadUrl: "https://fastly.picsum.photos/id/1/5000/3333.jpg?hmac=Asv2DU3rA_5D1xSe22xZK47WEAN0wjWeFOhzd13ujW4")).navigationTitle("Photo Detail")
}
