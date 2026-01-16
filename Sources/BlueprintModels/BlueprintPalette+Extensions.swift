//

import SwiftUI

public extension BlueprintPalette {

    func transparencyRemoved(with parent: BlueprintPalette?) -> BlueprintPalette {

        func useParentIfTransparent(_ color: String, parent: String?) -> String {
            if let parent, color.count >= 9, color.hasSuffix("00") {
                return parent
            } else {
                return color
            }
        }

        return BlueprintPalette(
            accentColour: accentColour,
            background: useParentIfTransparent(background, parent: parent?.background),
            commentCount: commentCount,
            elementBackground: elementBackground,
            headline: headline,
            immersiveKicker: immersiveKicker,
            main: main,
            mediaBackground: mediaBackground,
            mediaIcon: mediaIcon,
            metaText: metaText,
            pill: pill,
            pillar: pillar,
            secondary: secondary,
            shadow: shadow,
            topBorder: topBorder,
            kickerText: kickerText,
            mediaPillBackground: mediaPillBackground,
            mediaPillForeground: mediaPillForeground
        )
    }
}

public extension Array where Element == BlueprintPalette {
    var mostCommon: BlueprintPalette? {
        var paletteCounts: [BlueprintPalette: Int] = [:]

        for palette in self {
            paletteCounts[palette, default: 0] += 1
        }

        return paletteCounts.max { $0.value < $1.value }?.key
    }
}

public extension BlueprintPalette {
    static var defaultLight: BlueprintPalette {
        BlueprintPalette(
            accentColour: "#C70000",
            background: "#FFFFFF",
            commentCount: "#757575",
            elementBackground: "#FF4E36",
            headline: "#121212",
            immersiveKicker: "#FFDBE2",
            main: "#C70000",
            mediaBackground: "#DCDCDC",
            mediaIcon: "#FFFFFF",
            metaText: "#444444",
            pill: "#EDEDED",
            pillar: "#121212",
            secondary: "#FF4E36",
            shadow: "#DCDCDC",
            topBorder: "#DCDCDC",
            kickerText: "#C70000",
            mediaPillBackground: "#121212",
            mediaPillForeground: "#DCDCDC"
        )
    }
    static var defaultDark: BlueprintPalette {
        BlueprintPalette(
            accentColour: "#FF4E36",
            background: "#000000",
            commentCount: "#999999",
            elementBackground: "#FF4E36",
            headline: "#DCDCDC",
            immersiveKicker: "#FFDBE2",
            main: "#FF4E36",
            mediaBackground: "#333333",
            mediaIcon: "#000000",
            metaText: "#999999",
            pill: "#DCDCDC",
            pillar: "#C70000",
            secondary: "#FF4E36",
            shadow: "#333333",
            topBorder: "#333333",
            kickerText: "#FF4E36",
            mediaPillBackground: "#121212",
            mediaPillForeground: "#DCDCDC"
        )
    }
}
