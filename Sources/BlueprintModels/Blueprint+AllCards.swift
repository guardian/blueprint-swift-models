//

import Foundation

public protocol BlueprintCardProvider {
    var allCards: [BlueprintCard] { get }
}

extension BlueprintCollection: BlueprintCardProvider {

    public var allCards: [BlueprintCard] {
        rows.flatMap(\.allCards)
    }
}

extension BlueprintRow: BlueprintCardProvider {
    public var allCards: [BlueprintCard] {
        columns.flatMap(\.allCards)
    }
}

extension BlueprintColumn: BlueprintCardProvider {
    public var allCards: [BlueprintCard] {
        cards
    }
}

public extension Array where Element: BlueprintCardProvider {
    var allCards: [[BlueprintCard]] {
        self.map(\.allCards)
    }
}
