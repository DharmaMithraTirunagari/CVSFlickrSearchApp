//
//  FlickrImage.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import Foundation

struct FlickrResponse: Codable {
    let items: [FlickrImage]
}

struct FlickrImage: Codable, Identifiable {
    var id: String { link }

    let title: String?
    let link: String
    let media: Media?
    let description: String?
    let published: String?
    let author: String?

    // Extracts and cleans the main description from the `description` HTML.
    var parsedDescription: String {
        guard let description = description else { return "No Description" }
        let regex = try? NSRegularExpression(pattern: "<p>(.*?)<\\/p>")
        if let matches = regex?.matches(in: description, range: NSRange(description.startIndex..., in: description)),
           matches.count >= 3,
           let range = Range(matches[2].range(at: 1), in: description) {
            return description[range].trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return "No Description"
    }

    // Extracts a clean and readable author name.
    var parsedAuthor: String {
        guard let author = author else { return "Unknown Author" }
        let regex = try? NSRegularExpression(pattern: "\\(\"(.*?)\"\\)")
        if let match = regex?.firstMatch(in: author, range: NSRange(author.startIndex..., in: author)),
           let range = Range(match.range(at: 1), in: author) {
            return author[range].capitalized
        }
        return "Unknown Author"
    }

    // Extracts and formats the published date into a readable format.
    var formattedPublishedDate: String {
        guard let published = published else { return "Unknown Date" }
        let isoDateFormatter = ISO8601DateFormatter()
        let displayDateFormatter = DateFormatter()
        displayDateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        displayDateFormatter.timeZone = TimeZone(identifier: "UTC")

        if let date = isoDateFormatter.date(from: published) {
            return displayDateFormatter.string(from: date)
        }
        return "Unknown Date"
    }

    // Extracts width & height of the image from the `description` if available.
    var dimensions: (width: Int?, height: Int?) {
        guard let description = description else { return (nil, nil) }
        return parseDimensions(from: description)
    }

    // Parses width & height values from the HTML description.
    private func parseDimensions(from description: String) -> (width: Int?, height: Int?) {
        let widthRegex = #"width\s*=\s*['"](\d+)['"]"#
        let heightRegex = #"height\s*=\s*['"](\d+)['"]"#

        let width = description.matchingFirstGroup(using: widthRegex).flatMap { Int($0) }
        let height = description.matchingFirstGroup(using: heightRegex).flatMap { Int($0) }

        return (width, height)
    }
}

struct Media: Codable {
    let mediaURL: String?

    enum CodingKeys: String, CodingKey {
        case mediaURL = "m"
    }
}

extension String {
    // Helper function to extract the first match of a regex pattern.
    func matchingFirstGroup(using regex: String) -> String? {
        guard let regex = try? NSRegularExpression(pattern: regex) else { return nil }
        let range = NSRange(startIndex..<endIndex, in: self)
        let match = regex.firstMatch(in: self, options: [], range: range)
        if let range = match?.range(at: 1), let swiftRange = Range(range, in: self) {
            return String(self[swiftRange])
        }
        return nil
    }
}

