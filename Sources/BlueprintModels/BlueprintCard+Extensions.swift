import Foundation

extension BlueprintCard: Identifiable {
    /// An identifier for the purposes of SwiftUI. Other Blueprint objects can rely on their hashes directly (`\.self`) for explicit identifiers
    /// in `forEach` views. However, cards (especially in the case of Empty cards) do not have enough uniquely identifable data
    /// to make their hashes unique. Therefore, if a BlueprintCard does not have an associated article, the Identifiable implementation
    /// makes use of the locally generated `localID` value as a unique identifier for the purposes of SwiftUI.
    public var id: Int {
        if article != nil {
            return hashValue
        } else {
            return _localID.hashValue
        }
    }
}

extension BlueprintCard.BlueprintCardType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unspecified:
            "Unspecified"
        case .article:
            "Article"
        case .podcast:
            "Podcast"
        case .video:
            "Video"
        case .crossword:
            "Crossword"
        case .display:
            "Display"
        case .numbered:
            "Numbered"
        case .empty:
            "Empty"
        case .webContent:
            "WebContent"
        case .podcastSeries:
            "PodcastSeries"
        case .highlight:
            "Highlight"
        case .navigation:
            "Navigation"
        case .gallery:
            "Gallery"
        }
    }
}
