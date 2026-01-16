//

import Foundation

public extension BlueprintImage {
    var aspectRatio: CGFloat? {
        if let width, let height {
            return CGFloat(width) / CGFloat(height)
        } else {
            return nil
        }
    }
}

public extension BlueprintImage {
    func imageURL(size: CGSize, scale: CGFloat) -> URL? {
        var urlString = urlTemplate
        urlString = urlString.replacingOccurrences(
            of: "#{width}",
            with: "\(Int(size.width * scale))"
        )
        urlString = urlString.replacingOccurrences(
            of: "#{height}",
            with: "\(Int(size.height * scale))"
        )
        urlString = urlString.replacingOccurrences(
            of: "#{quality}",
            with: "95"
        )

        guard let url = URL(string: urlString) else { return nil }
        return url
    }
}
