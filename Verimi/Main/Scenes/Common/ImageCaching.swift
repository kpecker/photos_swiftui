//
//  ImageCaching.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 31.07.24.
//

import SwiftUI

// Image cache manager
class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    
    private init() {
        cache.countLimit = 100 // Maximum number of images to cache
    }
    
    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}

// Image loader with caching
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var task: URLSessionDataTask?
    
    init(url: URL) {
        self.url = url
        loadImage()
    }
    
    private func loadImage() {
        // Check cache first
        if let cachedImage = ImageCache.shared.get(forKey: url.absoluteString) {
            self.image = cachedImage
            return
        }
        
        // If not in cache, download the image
        task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.image = image
                ImageCache.shared.set(image, forKey: self?.url.absoluteString ?? "")
            }
        }
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}

// Cached image view
struct CachedImageView: View {
    @StateObject private var imageLoader: ImageLoader
    
    init(url: URL) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }
    }
}
