//

import Foundation

public extension  Array where Element == BlueprintColumn {
    var numberOfColumns: Int {
        self.reduce(into: 0) {
            $0 += $1.preferredWidth
        }
    }
}
