//
//  ImageCell.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import SwiftUI

struct ImageCell: View {
    let image: FlickrImage

    var body: some View {
        AsyncImage(url: URL(string: image.media?.mediaURL ?? "")) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 110)
                    .clipped()
                    .cornerRadius(8)
            } else {
                ProgressView()
                    .frame(width: 110, height: 110)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(image.title ?? "Untitled Image")
        .accessibilityValue("By \(image.parsedAuthor)")
    }
}
