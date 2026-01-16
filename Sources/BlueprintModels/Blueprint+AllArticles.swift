//

import Foundation

public protocol BlueprintArticleProvider {
    var allArticles: [BlueprintArticle] { get }
}

extension BlueprintCollection: BlueprintArticleProvider {

    /// An array containing all `BlueprintArticle` instances in the collection. Collections may not contain any articles at all (e.g. the titlepiece)
    ///
    /// This property iterates over all rows and columns of the collection and gathers all articles, including sublinks, into a single array.
    public var allArticles: [BlueprintArticle] {
        rows.flatMap(\.allArticles)
    }
}

extension BlueprintRow: BlueprintArticleProvider {
    public var allArticles: [BlueprintArticle] {
        columns.flatMap(\.allArticles)
    }
}

extension BlueprintColumn: BlueprintArticleProvider {
    public var allArticles: [BlueprintArticle] {
        cards.flatMap(\.allArticles)
    }
}

extension BlueprintCard: BlueprintArticleProvider {
    public var allArticles: [BlueprintArticle] {
        var allArticles = [BlueprintArticle]()

        if let article = article {
            allArticles.append(article)
        }
        allArticles.append(contentsOf: sublinks)

        return allArticles
    }
}

public extension Array where Element: BlueprintArticleProvider {

    /// An array of all `BlueprintArticle`grouped by their collection. 
    var allArticles: [[BlueprintArticle]] {
        self.map(\.allArticles)
    }
}
