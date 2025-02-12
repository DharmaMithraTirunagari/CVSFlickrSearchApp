//
//  ImageDetailView.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import SwiftUI

struct ImageDetailView: View {
    let image: FlickrImage

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image.media?.mediaURL ?? "")) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                        .clipped()
                        .applyCardStyle()
                        .accessibilityLabel("Image of \(String(describing: self.image.title))")
                        .accessibilityHint("Swipe left or right to explore details")
                } else {
                    ProgressView()
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                }
            }

            // Details Section
            VStack(alignment: .leading, spacing: 12) {
                Text(image.title ?? "Untitled Image")
                    .font(.title3)
                    .dynamicTypeSize(.xSmall ... .xLarge)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityLabel("Title: \(String(describing: image.title))")

                HStack {
                    Text("📸 Author: ")
                        .fontWeight(.medium)
                        .dynamicTypeSize(.xSmall ... .xLarge)
                    Text(image.parsedAuthor)
                        .foregroundColor(.secondary)
                        .dynamicTypeSize(.xSmall ... .xLarge)
                        .accessibilityLabel("Author: \(image.parsedAuthor)")
                }

                HStack {
                    Text("🗓 Published: ")
                        .fontWeight(.medium)
                        .dynamicTypeSize(.xSmall ... .xLarge)
                    Text(image.formattedPublishedDate)
                        .foregroundColor(.secondary)
                        .dynamicTypeSize(.xSmall ... .xLarge)
                }

                if let width = image.dimensions.width, let height = image.dimensions.height {
                    HStack {
                        Text("📏 Size: ")
                            .fontWeight(.medium)
                            .dynamicTypeSize(.xSmall ... .xLarge)
                        Text("\(width) x \(height) pixels")
                            .foregroundColor(.secondary)
                            .dynamicTypeSize(.xSmall ... .xLarge)
                    }
                }

                Spacer()

                // Action Buttons with Equal Width
                HStack(spacing: 15) {
                    Button(action: shareImage) {
                        Label("Share", systemImage: "square.and.arrow.up")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .accessibilityLabel("Share button")
                    .accessibilityHint("Double-tap to share this image")
                }
                .frame(maxWidth: .infinity) // Ensuring equal width
            }
            .padding()
        }
        .navigationTitle("Image Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    // Share Function with Correct UIWindowScene Handling
    private func shareImage() {
        let url = URL(string: image.link)!
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = windowScene.windows.first?.rootViewController {
            rootVC.present(activityVC, animated: true)
        }
    }
}

