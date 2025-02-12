//
//  ImageGridView.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import SwiftUI

struct ImageGridView: View {
    let images: [FlickrImage]

    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(images) { image in
                    NavigationLink(destination: ImageDetailView(image: image)
                        .transition(.move(edge: .trailing))) {
                            AsyncImage(url: URL(string: image.media?.mediaURL ?? "")) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaledToFill()
                                    .frame(width: 110, height: 110)
                                    .clipped()
                                    .cornerRadius(10)
                            } else {
                                ProgressView()
                                    .frame(width: 110, height: 110)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 12) 
        }
    }
}



