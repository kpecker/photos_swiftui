//
//  PhotosViewModel.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 30.07.24.
//

import Foundation
import Combine

@MainActor class PhotosViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    @Published var favPhotos: [Photo] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    func getPhotos()  {
        let apiClient = URLSessionAPIClient<PhotosEndpoint>()
        
        let response: AnyPublisher<[Photo], Error> = apiClient.request(.photos)
        response
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        receiveValue: {[weak self] response in
            DispatchQueue.main.async {
                self?.photos = response
            }
        }
        .store(in: &cancellables)
    }
    
    func getFavPhotos() {
        favPhotos = photos.filter({ photo in
            photo.isFavourite == true
        })
    }
    
    func setFav(photo: Photo) {
        if let row = self.photos.firstIndex(where: {$0.id == photo.id}) {
            photos[row].isFavourite = photo.isFavourite
        }
    }
}
