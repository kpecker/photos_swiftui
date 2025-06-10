//
//  AppImageView.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 31.07.24.
//

import SwiftUI
import NukeUI

struct AppImageView: View {
    var urlString: String
    
    var body: some View {
        LazyImage(url: URL(string: urlString))
        { state in
            if let image = state.image {
                image
            } else if state.error != nil {
                Image(systemName: "exclamationmark.warninglight")
                    .foregroundColor(.red)
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    AppImageView(urlString: "https://via.placeholder.com/150/92c952")
}
