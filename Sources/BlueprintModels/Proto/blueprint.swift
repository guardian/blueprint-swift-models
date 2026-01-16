import Foundation

// MARK: - Structs
public struct BlueprintAdTargetingParams: Hashable, Equatable, Sendable {
    public let adTargeting: [String: String]
    public private(set) var _backingData: Data?

    public init(
         adTargeting: [String: String]
    ) {
        self.adTargeting = adTargeting
    }

    public init?(data: Data) {
        if let proto = try? ProtoAdTargetingParams(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoAdTargetingParams) {
        self.adTargeting = proto.adTargeting.reduce(into: [String: String]()) { $0[$1.key] = $1.value }
    }
}

public struct BlueprintArticle: Hashable, Equatable, Sendable {
    public let id: String
    public let byline: String?
    public let images: [BlueprintImage]
    public let links: BlueprintLinks?
    public let kicker: String?
    public let title: String?
    public let trailText: String?
    public let rating: Int?
    public let commentCount: Int?
    public let publishedDate: Date?
    public let lastUpdatedDate: Date?
    public let mediaType: BlueprintMediaType?
    public let duration: TimeInterval?
    public let profileImage: BlueprintImage?
    public let events: [BlueprintLiveEvent]
    public let paletteLight: BlueprintPalette?
    public let paletteDark: BlueprintPalette?
    public let applePodcastURL: URL?
    public let googlePodcastURL: URL?
    public let spotifyPodcastURL: URL?
    public let videos: [BlueprintVideo]

    // This is an indicator as to whether a live blog is still blogging, or if
    // it's been closed.
    public let isLive: Bool
    public let pocketCastPodcastURL: URL?
    public let renderedItemProd: BlueprintRenderingPlatformSupport?
    public let renderedItemBeta: BlueprintRenderingPlatformSupport?
    public let showQuotedHeadline: Bool
    public let webContentUri: URL?
    public let tracking: BlueprintTracking
    public let audio: BlueprintAudio?
    public let podcastSeries: BlueprintPodcastSeries?
    public let adTargetingParams: BlueprintAdTargetingParams

    // Needed on lists and articles whereas collections use the adUnit
    // defined in the fronts response (e.g uk/fronts/home)
    public let adUnit: String?
    public let shouldHideReaderRevenue: Bool
    public let shouldHideAdverts: Bool
    public let shouldHideNav: Bool

    // It is available when the listen-to-article is supported on this article
    public let listenToArticle: BlueprintListenToArticle?

    // Number of images in a gallery card. This is used to display gallery
    // metadata on card when the media_type is MEDIA_TYPE_IMAGE.
    public let galleryImageCount: Int?
    public let basicTags: [BlueprintBasicTag]
    public let followUp: BlueprintFollowUp?
    public let mediaPill: BlueprintMediaPill?
    public private(set) var _backingData: Data?

    public init(
         id: String,
         byline: String?,
         images: [BlueprintImage],
         links: BlueprintLinks?,
         kicker: String?,
         title: String?,
         trailText: String?,
         rating: Int?,
         commentCount: Int?,
         publishedDate: Date?,
         lastUpdatedDate: Date?,
         mediaType: BlueprintMediaType?,
         duration: TimeInterval?,
         profileImage: BlueprintImage?,
         events: [BlueprintLiveEvent],
         paletteLight: BlueprintPalette?,
         paletteDark: BlueprintPalette?,
         applePodcastURL: URL?,
         googlePodcastURL: URL?,
         spotifyPodcastURL: URL?,
         videos: [BlueprintVideo],
         isLive: Bool,
         pocketCastPodcastURL: URL?,
         renderedItemProd: BlueprintRenderingPlatformSupport?,
         renderedItemBeta: BlueprintRenderingPlatformSupport?,
         showQuotedHeadline: Bool,
         webContentUri: URL?,
         tracking: BlueprintTracking,
         audio: BlueprintAudio?,
         podcastSeries: BlueprintPodcastSeries?,
         adTargetingParams: BlueprintAdTargetingParams,
         adUnit: String?,
         shouldHideReaderRevenue: Bool,
         shouldHideAdverts: Bool,
         shouldHideNav: Bool,
         listenToArticle: BlueprintListenToArticle?,
         galleryImageCount: Int?,
         basicTags: [BlueprintBasicTag],
         followUp: BlueprintFollowUp?,
         mediaPill: BlueprintMediaPill?
    ) {
        self.id = id
        self.byline = byline
        self.images = images
        self.links = links
        self.kicker = kicker
        self.title = title
        self.trailText = trailText
        self.rating = rating
        self.commentCount = commentCount
        self.publishedDate = publishedDate
        self.lastUpdatedDate = lastUpdatedDate
        self.mediaType = mediaType
        self.duration = duration
        self.profileImage = profileImage
        self.events = events
        self.paletteLight = paletteLight
        self.paletteDark = paletteDark
        self.applePodcastURL = applePodcastURL
        self.googlePodcastURL = googlePodcastURL
        self.spotifyPodcastURL = spotifyPodcastURL
        self.videos = videos
        self.isLive = isLive
        self.pocketCastPodcastURL = pocketCastPodcastURL
        self.renderedItemProd = renderedItemProd
        self.renderedItemBeta = renderedItemBeta
        self.showQuotedHeadline = showQuotedHeadline
        self.webContentUri = webContentUri
        self.tracking = tracking
        self.audio = audio
        self.podcastSeries = podcastSeries
        self.adTargetingParams = adTargetingParams
        self.adUnit = adUnit
        self.shouldHideReaderRevenue = shouldHideReaderRevenue
        self.shouldHideAdverts = shouldHideAdverts
        self.shouldHideNav = shouldHideNav
        self.listenToArticle = listenToArticle
        self.galleryImageCount = galleryImageCount
        self.basicTags = basicTags
        self.followUp = followUp
        self.mediaPill = mediaPill
    }

    public init?(data: Data) {
        if let proto = try? ProtoArticle(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoArticle) {
        self.id = proto.id
        if proto.hasByline {
            self.byline = proto.byline
        } else {
            self.byline = nil
        }
        self.images = proto.images.compactMap { BlueprintImage(proto: $0) }
        if proto.hasLinks {
            self.links = BlueprintLinks(proto: proto.links)
        } else {
            self.links = nil
        }
        if proto.hasKicker {
            self.kicker = proto.kicker
        } else {
            self.kicker = nil
        }
        if proto.hasTitle {
            self.title = proto.title
        } else {
            self.title = nil
        }
        if proto.hasTrailText {
            self.trailText = proto.trailText
        } else {
            self.trailText = nil
        }
        if proto.hasRating {
            self.rating = Int(exactly: proto.rating)!
        } else {
            self.rating = nil
        }
        if proto.hasCommentCount {
            self.commentCount = Int(exactly: proto.commentCount)!
        } else {
            self.commentCount = nil
        }
        if proto.hasPublishedDate {
            self.publishedDate = proto.publishedDate.date
        } else {
            self.publishedDate = nil
        }
        if proto.hasLastUpdatedDate {
            self.lastUpdatedDate = proto.lastUpdatedDate.date
        } else {
            self.lastUpdatedDate = nil
        }
        if proto.hasMediaType {
            self.mediaType = BlueprintMediaType(proto: proto.mediaType)
        } else {
            self.mediaType = nil
        }
        if proto.hasDuration {
            self.duration = proto.duration.timeInterval
        } else {
            self.duration = nil
        }
        if proto.hasProfileImage {
            self.profileImage = BlueprintImage(proto: proto.profileImage)
        } else {
            self.profileImage = nil
        }
        self.events = proto.events.compactMap { BlueprintLiveEvent(proto: $0) }
        if proto.hasPaletteLight {
            self.paletteLight = BlueprintPalette(proto: proto.paletteLight)
        } else {
            self.paletteLight = nil
        }
        if proto.hasPaletteDark {
            self.paletteDark = BlueprintPalette(proto: proto.paletteDark)
        } else {
            self.paletteDark = nil
        }
        if proto.hasApplePodcastURL {
            self.applePodcastURL = URL(string: proto.applePodcastURL)
        } else {
            self.applePodcastURL = nil
        }
        if proto.hasGooglePodcastURL {
            self.googlePodcastURL = URL(string: proto.googlePodcastURL)
        } else {
            self.googlePodcastURL = nil
        }
        if proto.hasSpotifyPodcastURL {
            self.spotifyPodcastURL = URL(string: proto.spotifyPodcastURL)
        } else {
            self.spotifyPodcastURL = nil
        }
        self.videos = proto.videos.compactMap { BlueprintVideo(proto: $0) }
        if proto.hasIsLive {
            self.isLive = proto.isLive
        } else {
            self.isLive = false
        }
        if proto.hasPocketCastPodcastURL {
            self.pocketCastPodcastURL = URL(string: proto.pocketCastPodcastURL)
        } else {
            self.pocketCastPodcastURL = nil
        }
        if proto.hasRenderedItemProd {
            self.renderedItemProd = BlueprintRenderingPlatformSupport(proto: proto.renderedItemProd)
        } else {
            self.renderedItemProd = nil
        }
        if proto.hasRenderedItemBeta {
            self.renderedItemBeta = BlueprintRenderingPlatformSupport(proto: proto.renderedItemBeta)
        } else {
            self.renderedItemBeta = nil
        }
        if proto.hasShowQuotedHeadline {
            self.showQuotedHeadline = proto.showQuotedHeadline
        } else {
            self.showQuotedHeadline = false
        }
        if proto.hasWebContentUri {
            self.webContentUri = URL(string: proto.webContentUri)
        } else {
            self.webContentUri = nil
        }
        if let tracking = BlueprintTracking(proto: proto.tracking) {
            self.tracking = tracking
        } else {
            return nil
        }
        if proto.hasAudio {
            self.audio = BlueprintAudio(proto: proto.audio)
        } else {
            self.audio = nil
        }
        if proto.hasPodcastSeries {
            self.podcastSeries = BlueprintPodcastSeries(proto: proto.podcastSeries)
        } else {
            self.podcastSeries = nil
        }
        if let adTargetingParams = BlueprintAdTargetingParams(proto: proto.adTargetingParams) {
            self.adTargetingParams = adTargetingParams
        } else {
            return nil
        }
        if proto.hasAdUnit {
            self.adUnit = proto.adUnit
        } else {
            self.adUnit = nil
        }
        self.shouldHideReaderRevenue = proto.shouldHideReaderRevenue
        self.shouldHideAdverts = proto.shouldHideAdverts
        self.shouldHideNav = proto.shouldHideNav
        if proto.hasListenToArticle {
            self.listenToArticle = BlueprintListenToArticle(proto: proto.listenToArticle)
        } else {
            self.listenToArticle = nil
        }
        if proto.hasGalleryImageCount {
            self.galleryImageCount = Int(exactly: proto.galleryImageCount)!
        } else {
            self.galleryImageCount = nil
        }
        self.basicTags = proto.basicTags.compactMap { BlueprintBasicTag(proto: $0) }
        if proto.hasFollowUp {
            self.followUp = BlueprintFollowUp(proto: proto.followUp)
        } else {
            self.followUp = nil
        }
        if proto.hasMediaPill {
            self.mediaPill = BlueprintMediaPill(proto: proto.mediaPill)
        } else {
            self.mediaPill = nil
        }
    }
}

public struct BlueprintAudio: Hashable, Equatable, Sendable {
    public let id: String
    public let source: String?
    public let durationInSeconds: Int?
    public let uri: URL
    public let adFreeUri: URL
    public let mimeType: String?
    public let articleID: String?
    public let links: BlueprintLinks?
    public let title: String?
    public let byline: String?
    public private(set) var _backingData: Data?

    public init(
         id: String,
         source: String?,
         durationInSeconds: Int?,
         uri: URL,
         adFreeUri: URL,
         mimeType: String?,
         articleID: String?,
         links: BlueprintLinks?,
         title: String?,
         byline: String?
    ) {
        self.id = id
        self.source = source
        self.durationInSeconds = durationInSeconds
        self.uri = uri
        self.adFreeUri = adFreeUri
        self.mimeType = mimeType
        self.articleID = articleID
        self.links = links
        self.title = title
        self.byline = byline
    }

    public init?(data: Data) {
        if let proto = try? ProtoAudio(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoAudio) {
        self.id = proto.id
        if proto.hasSource {
            self.source = proto.source
        } else {
            self.source = nil
        }
        if proto.hasDurationInSeconds {
            self.durationInSeconds = Int(exactly: proto.durationInSeconds)!
        } else {
            self.durationInSeconds = nil
        }
        if let uri = URL(string: proto.uri) {
            self.uri = uri
        } else {
            return nil
        }
        if let adFreeUri = URL(string: proto.adFreeUri) {
            self.adFreeUri = adFreeUri
        } else {
            return nil
        }
        if proto.hasMimeType {
            self.mimeType = proto.mimeType
        } else {
            self.mimeType = nil
        }
        if proto.hasArticleID {
            self.articleID = proto.articleID
        } else {
            self.articleID = nil
        }
        if proto.hasLinks {
            self.links = BlueprintLinks(proto: proto.links)
        } else {
            self.links = nil
        }
        if proto.hasTitle {
            self.title = proto.title
        } else {
            self.title = nil
        }
        if proto.hasByline {
            self.byline = proto.byline
        } else {
            self.byline = nil
        }
    }
}

public struct BlueprintBasicTag: Hashable, Equatable, Sendable {
    public let id: String
    public let webTitle: String
    public private(set) var _backingData: Data?

    public init(
         id: String,
         webTitle: String
    ) {
        self.id = id
        self.webTitle = webTitle
    }

    public init?(data: Data) {
        if let proto = try? ProtoBasicTag(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoBasicTag) {
        self.id = proto.id
        self.webTitle = proto.webTitle
    }
}

public struct BlueprintBranding: Hashable, Equatable, Sendable {
    public let brandingType: String
    public let sponsorName: String?
    public let logo: String?
    public let sponsorUri: URL?
    public let label: String?
    public let aboutUri: URL?
    public let altLogo: String?
    public private(set) var _backingData: Data?

    public init(
         brandingType: String,
         sponsorName: String?,
         logo: String?,
         sponsorUri: URL?,
         label: String?,
         aboutUri: URL?,
         altLogo: String?
    ) {
        self.brandingType = brandingType
        self.sponsorName = sponsorName
        self.logo = logo
        self.sponsorUri = sponsorUri
        self.label = label
        self.aboutUri = aboutUri
        self.altLogo = altLogo
    }

    public init?(data: Data) {
        if let proto = try? ProtoBranding(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoBranding) {
        self.brandingType = proto.brandingType
        if proto.hasSponsorName {
            self.sponsorName = proto.sponsorName
        } else {
            self.sponsorName = nil
        }
        if proto.hasLogo {
            self.logo = proto.logo
        } else {
            self.logo = nil
        }
        if proto.hasSponsorUri {
            self.sponsorUri = URL(string: proto.sponsorUri)
        } else {
            self.sponsorUri = nil
        }
        if proto.hasLabel {
            self.label = proto.label
        } else {
            self.label = nil
        }
        if proto.hasAboutUri {
            self.aboutUri = URL(string: proto.aboutUri)
        } else {
            self.aboutUri = nil
        }
        if proto.hasAltLogo {
            self.altLogo = proto.altLogo
        } else {
            self.altLogo = nil
        }
    }
}

public struct BlueprintCard: Hashable, Equatable, Sendable {
    public let type: BlueprintCardType

    // The article that this card is representing. It is optional
    // because not all cards will have an article associated with
    // them i.e Crosswords or Web content.
    public let article: BlueprintArticle?

    // Boosted cards show a boosted headline size.
    // It will be deprecated after we have switched to card size and
    // boost level to indicate the headline size.
    public let boosted: Bool

    // Compact cards don't show all the information that non-compact cards do,
    // and tend to appear in a carousel.
    // It will be deprecated after we have switched to card size and
    // boost level to indicate the card size.
    public let compact: Bool
    public let sublinks: [BlueprintArticle]
    public let htmlFallback: String?

    // Individual cards can be branded and not be part of a branded container.
    // Cards that are branded tend to show the sponsor logo and should be
    // returned with a different palette.
    public let branding: BlueprintBranding?

    // Individual cards can be defined as "premium content". If premium_content
    // is true then it implies the card should be hidden from signed-in users,
    // for example if the card has been paid for by an external sponsor.
    public let premiumContent: Bool
    public let sublinksPaletteLight: BlueprintPalette?
    public let sublinksPaletteDark: BlueprintPalette?

    // This is the number to be used when the card type is CARD_TYPE_NUMBERED.
    public let cardNumber: Int?

    // This optional field is set if this card type is CARD_TYPE_PODCAST_SERIES.
    // It provides the details on the podcast series.
    public let podcastSeries: BlueprintPodcastSeries?

    // The correspondingTags is to denote which of the tags that a user has
    // selected are applied to a particular content item
    public let correspondingTags: [BlueprintMyGuardianFollow]

    // Mega-boosted cards show a even larger headline size.
    // It is deprecated as we switch to card size and boost level to
    // indicate the headline size.
/// This property has been marked as **deprecated** in the proto file
    public let megaBoosted: Bool

    // Indicate how many columns the trail image is expected to take.
    // It is deprecated as we switch to card size and boost level to
    // indicate in what size to display the trail image.
/// This property has been marked as **deprecated** in the proto file
    public let trailImageSize: Int?

    // Deprecated field.  It was the aspect ratio for trail image but
    // it was no longer needed because the card size can imply the image
    // aspect ratio needed.  When a card size can support a new image
    // aspect ratio and the old 5:3 crop, the native can check
    // the preferred_image_aspect_ratio property in the collection.
    // reserved 40;
    // reserved "trail_image_aspect_ratio";
    // Define constants for the arrangement of sublinks on a card
    // Indicate how sublinks are arranged.
    // It is deprecated as it is replaced by a new field named
    // preferred_sublinks_arrangement.
/// This property has been marked as **deprecated** in the proto file
    public let sublinksArrangement: BlueprintSublinksArrangement?

    // Define different levels for headline size
    // Indicate the size of a headline.
    // It is deprecated as we switch to card size and boost level to
    // indicate the headline size.
/// This property has been marked as **deprecated** in the proto file
    public let boostedHeadline: BlueprintBoostedHeadline?

    // Define constants for positions to display the headline in a card.
    // Indictate where to display the headline.
    // It is deprecated as the headline position is implied by
    // the card size.
/// This property has been marked as **deprecated** in the proto file
    public let headlinePosition: BlueprintHeadlinePosition?

    // Define card sizes
    public let cardSize: BlueprintCardSize?
    public let boostLevel: Int?

    // Indicate how sublinks are arranged.
    public let preferredSublinksArrangement: BlueprintSublinksArrangement?

    // Control how the top border is displayed.
    public let topBorderStyle: BlueprintTopBorderStyle?

    // Control what font weight to use for the headline.
    public let headlineWeight: BlueprintFontWeight?
    public let navCardType: BlueprintNavCardType?
    public let shouldHideImage: Bool

    // Provide a separate palette for Android's condensed view.
    public let condensedPaletteLight: BlueprintPalette?
    public let condensedPaletteDark: BlueprintPalette?
    public let _localID = UUID()
    public private(set) var _backingData: Data?

    public init(
         type: BlueprintCardType,
         article: BlueprintArticle?,
         boosted: Bool,
         compact: Bool,
         sublinks: [BlueprintArticle],
         htmlFallback: String?,
         branding: BlueprintBranding?,
         premiumContent: Bool,
         sublinksPaletteLight: BlueprintPalette?,
         sublinksPaletteDark: BlueprintPalette?,
         cardNumber: Int?,
         podcastSeries: BlueprintPodcastSeries?,
         correspondingTags: [BlueprintMyGuardianFollow],
         megaBoosted: Bool,
         trailImageSize: Int?,
         sublinksArrangement: BlueprintSublinksArrangement?,
         boostedHeadline: BlueprintBoostedHeadline?,
         headlinePosition: BlueprintHeadlinePosition?,
         cardSize: BlueprintCardSize?,
         boostLevel: Int?,
         preferredSublinksArrangement: BlueprintSublinksArrangement?,
         topBorderStyle: BlueprintTopBorderStyle?,
         headlineWeight: BlueprintFontWeight?,
         navCardType: BlueprintNavCardType?,
         shouldHideImage: Bool,
         condensedPaletteLight: BlueprintPalette?,
         condensedPaletteDark: BlueprintPalette?
    ) {
        self.type = type
        self.article = article
        self.boosted = boosted
        self.compact = compact
        self.sublinks = sublinks
        self.htmlFallback = htmlFallback
        self.branding = branding
        self.premiumContent = premiumContent
        self.sublinksPaletteLight = sublinksPaletteLight
        self.sublinksPaletteDark = sublinksPaletteDark
        self.cardNumber = cardNumber
        self.podcastSeries = podcastSeries
        self.correspondingTags = correspondingTags
        self.megaBoosted = megaBoosted
        self.trailImageSize = trailImageSize
        self.sublinksArrangement = sublinksArrangement
        self.boostedHeadline = boostedHeadline
        self.headlinePosition = headlinePosition
        self.cardSize = cardSize
        self.boostLevel = boostLevel
        self.preferredSublinksArrangement = preferredSublinksArrangement
        self.topBorderStyle = topBorderStyle
        self.headlineWeight = headlineWeight
        self.navCardType = navCardType
        self.shouldHideImage = shouldHideImage
        self.condensedPaletteLight = condensedPaletteLight
        self.condensedPaletteDark = condensedPaletteDark
    }

    public init?(data: Data) {
        if let proto = try? ProtoCard(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoCard) {
        if let type = BlueprintCardType(proto: proto.type) {
            self.type = type
        } else {
            return nil
        }
        if proto.hasArticle {
            self.article = BlueprintArticle(proto: proto.article)
        } else {
            self.article = nil
        }
        if proto.hasBoosted {
            self.boosted = proto.boosted
        } else {
            self.boosted = false
        }
        if proto.hasCompact {
            self.compact = proto.compact
        } else {
            self.compact = false
        }
        self.sublinks = proto.sublinks.compactMap { BlueprintArticle(proto: $0) }
        if proto.hasHtmlFallback {
            self.htmlFallback = proto.htmlFallback
        } else {
            self.htmlFallback = nil
        }
        if proto.hasBranding {
            self.branding = BlueprintBranding(proto: proto.branding)
        } else {
            self.branding = nil
        }
        if proto.hasPremiumContent {
            self.premiumContent = proto.premiumContent
        } else {
            self.premiumContent = false
        }
        if proto.hasSublinksPaletteLight {
            self.sublinksPaletteLight = BlueprintPalette(proto: proto.sublinksPaletteLight)
        } else {
            self.sublinksPaletteLight = nil
        }
        if proto.hasSublinksPaletteDark {
            self.sublinksPaletteDark = BlueprintPalette(proto: proto.sublinksPaletteDark)
        } else {
            self.sublinksPaletteDark = nil
        }
        if proto.hasCardNumber {
            self.cardNumber = Int(exactly: proto.cardNumber)!
        } else {
            self.cardNumber = nil
        }
        if proto.hasPodcastSeries {
            self.podcastSeries = BlueprintPodcastSeries(proto: proto.podcastSeries)
        } else {
            self.podcastSeries = nil
        }
        self.correspondingTags = proto.correspondingTags.compactMap { BlueprintMyGuardianFollow(proto: $0) }
        if proto.hasMegaBoosted {
            self.megaBoosted = proto.megaBoosted
        } else {
            self.megaBoosted = false
        }
        if proto.hasTrailImageSize {
            self.trailImageSize = Int(exactly: proto.trailImageSize)!
        } else {
            self.trailImageSize = nil
        }
        if proto.hasSublinksArrangement {
            self.sublinksArrangement = BlueprintSublinksArrangement(proto: proto.sublinksArrangement)
        } else {
            self.sublinksArrangement = nil
        }
        if proto.hasBoostedHeadline {
            self.boostedHeadline = BlueprintBoostedHeadline(proto: proto.boostedHeadline)
        } else {
            self.boostedHeadline = nil
        }
        if proto.hasHeadlinePosition {
            self.headlinePosition = BlueprintHeadlinePosition(proto: proto.headlinePosition)
        } else {
            self.headlinePosition = nil
        }
        if proto.hasCardSize {
            self.cardSize = BlueprintCardSize(proto: proto.cardSize)
        } else {
            self.cardSize = nil
        }
        if proto.hasBoostLevel {
            self.boostLevel = Int(exactly: proto.boostLevel)!
        } else {
            self.boostLevel = nil
        }
        if proto.hasPreferredSublinksArrangement {
            self.preferredSublinksArrangement = BlueprintSublinksArrangement(proto: proto.preferredSublinksArrangement)
        } else {
            self.preferredSublinksArrangement = nil
        }
        if proto.hasTopBorderStyle {
            self.topBorderStyle = BlueprintTopBorderStyle(proto: proto.topBorderStyle)
        } else {
            self.topBorderStyle = nil
        }
        if proto.hasHeadlineWeight {
            self.headlineWeight = BlueprintFontWeight(proto: proto.headlineWeight)
        } else {
            self.headlineWeight = nil
        }
        if proto.hasNavCardType {
            self.navCardType = BlueprintNavCardType(proto: proto.navCardType)
        } else {
            self.navCardType = nil
        }
        if proto.hasShouldHideImage {
            self.shouldHideImage = proto.shouldHideImage
        } else {
            self.shouldHideImage = false
        }
        if proto.hasCondensedPaletteLight {
            self.condensedPaletteLight = BlueprintPalette(proto: proto.condensedPaletteLight)
        } else {
            self.condensedPaletteLight = nil
        }
        if proto.hasCondensedPaletteDark {
            self.condensedPaletteDark = BlueprintPalette(proto: proto.condensedPaletteDark)
        } else {
            self.condensedPaletteDark = nil
        }
    }
}

public struct BlueprintCollection: Hashable, Equatable, Sendable {
    public let id: String

    // A palette at the collection level is currently mapped from MAPI's
    // "navigation style". It's specified when the look and feel of an entire
    // container should be changed, for example when a container is "branded"
    // because the content has been paid for.
    public let paletteLight: BlueprintPalette?
    public let paletteDark: BlueprintPalette?

    // MAPI can technically return a list of empty rows. This might be because
    // MAPI doesn't support the specific content that's included in the
    // collection. In this case it's assumed the client will hide the entire
    // collection from the reader.
    // Another reason for empty rows is that the collection is a titlepiece.
    // In fact, we must keep the rows empty in this case in order not to break
    // old versions of app that were built before titlepiece is introduced.
    public let rows: [BlueprintRow]
    public let title: String?

    // We define branding at the collection level because certain containers
    // require a different look and feel, for example content published by
    // Guardian Labs.
    public let branding: BlueprintBranding?

    // A container can be defined as "premium". Currently this is just for the
    // Crosswords container for which only premium users are allowed to access
    // (although it is visible to all users). Note that the Crosswords
    // container is not curated by Editorial in the fronts tool but instead
    // created on the fly by MAPI.
    public let premiumContent: Bool
    public let followUp: BlueprintFollowUp?

    // This tells the app whether or not to render a "show/hide" button at the
    // top right of the container. For now, this is only used for thrashers,
    // which should not be hideable by the user.
    public let hideable: Bool
    public let myguardianFollow: BlueprintMyGuardianFollow?

    // For some design on specific types of collections, we want to show
    // an image and a description in the collection header.  This field is
    // used for award text if the collection design is
    // COLLECTION_DESIGN_TITLEPIECE.
    public let description: String?
    public let image: BlueprintImage?

    // This tells the app which design to use to render the collection
    public let design: BlueprintCollectionDesign?

    // When this attribute is true, the vertical spacing is removed from
    // the collection.
    public let compactPadding: Bool

    // The property gives the ID of the collection to be used in
    // the tracking data.
    public let trackingID: String?

    // The property is added when we build small story carousel where
    // the header is rendered in smaller size to show they are child
    // sections within a main collection.
/// This property has been marked as **deprecated** in the proto file
    public let smallHeading: Bool
    public let adTargetingParams: BlueprintAdTargetingParams?
    public let adUnit: String?

    // This tells the app in which style to display, or not display,
    // the title.  It should not be used any more as a new equivalent
    // enum class named "TitleStyle" is defined on the top level.
    // This property is deprecated in favour of the property title_style.
    // We still set this property to the same semantic value as
    // the title style for backward compatibility.
    public let headingStyle: BlueprintHeadingStyle?

    // The title of this collection for display.  It replaces
    // the old "title" property.
    public let displayTitle: String?
    public let lastUpdatedDate: Date?

    // Control in what style to display the collection title.
    public let titleStyle: BlueprintTitleStyle?

    // The default aspect ratio for trail images in this collection.
    public let preferredImageAspectRatio: BlueprintImageAspectRatio?
    public let tightenVerticalSpacing: Bool
    public private(set) var _backingData: Data?

    public init(
         id: String,
         paletteLight: BlueprintPalette?,
         paletteDark: BlueprintPalette?,
         rows: [BlueprintRow],
         title: String?,
         branding: BlueprintBranding?,
         premiumContent: Bool,
         followUp: BlueprintFollowUp?,
         hideable: Bool,
         myguardianFollow: BlueprintMyGuardianFollow?,
         description: String?,
         image: BlueprintImage?,
         design: BlueprintCollectionDesign?,
         compactPadding: Bool,
         trackingID: String?,
         smallHeading: Bool,
         adTargetingParams: BlueprintAdTargetingParams?,
         adUnit: String?,
         headingStyle: BlueprintHeadingStyle?,
         displayTitle: String?,
         lastUpdatedDate: Date?,
         titleStyle: BlueprintTitleStyle?,
         preferredImageAspectRatio: BlueprintImageAspectRatio?,
         tightenVerticalSpacing: Bool
    ) {
        self.id = id
        self.paletteLight = paletteLight
        self.paletteDark = paletteDark
        self.rows = rows
        self.title = title
        self.branding = branding
        self.premiumContent = premiumContent
        self.followUp = followUp
        self.hideable = hideable
        self.myguardianFollow = myguardianFollow
        self.description = description
        self.image = image
        self.design = design
        self.compactPadding = compactPadding
        self.trackingID = trackingID
        self.smallHeading = smallHeading
        self.adTargetingParams = adTargetingParams
        self.adUnit = adUnit
        self.headingStyle = headingStyle
        self.displayTitle = displayTitle
        self.lastUpdatedDate = lastUpdatedDate
        self.titleStyle = titleStyle
        self.preferredImageAspectRatio = preferredImageAspectRatio
        self.tightenVerticalSpacing = tightenVerticalSpacing
    }

    public init?(data: Data) {
        if let proto = try? ProtoCollection(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoCollection) {
        self.id = proto.id
        if proto.hasPaletteLight {
            self.paletteLight = BlueprintPalette(proto: proto.paletteLight)
        } else {
            self.paletteLight = nil
        }
        if proto.hasPaletteDark {
            self.paletteDark = BlueprintPalette(proto: proto.paletteDark)
        } else {
            self.paletteDark = nil
        }
        self.rows = proto.rows.compactMap { BlueprintRow(proto: $0) }
        if proto.hasTitle {
            self.title = proto.title
        } else {
            self.title = nil
        }
        if proto.hasBranding {
            self.branding = BlueprintBranding(proto: proto.branding)
        } else {
            self.branding = nil
        }
        if proto.hasPremiumContent {
            self.premiumContent = proto.premiumContent
        } else {
            self.premiumContent = false
        }
        if proto.hasFollowUp {
            self.followUp = BlueprintFollowUp(proto: proto.followUp)
        } else {
            self.followUp = nil
        }
        self.hideable = proto.hideable
        if proto.hasMyguardianFollow {
            self.myguardianFollow = BlueprintMyGuardianFollow(proto: proto.myguardianFollow)
        } else {
            self.myguardianFollow = nil
        }
        if proto.hasDescription_p {
            self.description = proto.description_p
        } else {
            self.description = nil
        }
        if proto.hasImage {
            self.image = BlueprintImage(proto: proto.image)
        } else {
            self.image = nil
        }
        if proto.hasDesign {
            self.design = BlueprintCollectionDesign(proto: proto.design)
        } else {
            self.design = nil
        }
        if proto.hasCompactPadding {
            self.compactPadding = proto.compactPadding
        } else {
            self.compactPadding = false
        }
        if proto.hasTrackingID {
            self.trackingID = proto.trackingID
        } else {
            self.trackingID = nil
        }
        if proto.hasSmallHeading {
            self.smallHeading = proto.smallHeading
        } else {
            self.smallHeading = false
        }
        if proto.hasAdTargetingParams {
            self.adTargetingParams = BlueprintAdTargetingParams(proto: proto.adTargetingParams)
        } else {
            self.adTargetingParams = nil
        }
        if proto.hasAdUnit {
            self.adUnit = proto.adUnit
        } else {
            self.adUnit = nil
        }
        if proto.hasHeadingStyle {
            self.headingStyle = BlueprintHeadingStyle(proto: proto.headingStyle)
        } else {
            self.headingStyle = nil
        }
        if proto.hasDisplayTitle {
            self.displayTitle = proto.displayTitle
        } else {
            self.displayTitle = nil
        }
        if proto.hasLastUpdatedDate {
            self.lastUpdatedDate = proto.lastUpdatedDate.date
        } else {
            self.lastUpdatedDate = nil
        }
        if proto.hasTitleStyle {
            self.titleStyle = BlueprintTitleStyle(proto: proto.titleStyle)
        } else {
            self.titleStyle = nil
        }
        if proto.hasPreferredImageAspectRatio {
            self.preferredImageAspectRatio = BlueprintImageAspectRatio(proto: proto.preferredImageAspectRatio)
        } else {
            self.preferredImageAspectRatio = nil
        }
        if proto.hasTightenVerticalSpacing {
            self.tightenVerticalSpacing = proto.tightenVerticalSpacing
        } else {
            self.tightenVerticalSpacing = false
        }
    }
}

public struct BlueprintColumn: Hashable, Equatable, Sendable {

    // By default, if there are multiple cards in the cards array then it's
    // expected the client will display these as stacked vertical elements.
    public let cards: [BlueprintCard]
    public let paletteLight: BlueprintPalette?
    public let paletteDark: BlueprintPalette?
    public let preferredWidth: Int

    // Decide whether to show horizontal dividers between cards which
    // are stacked in this column.
    public let showHorizontalDividers: Bool
    public private(set) var _backingData: Data?

    public init(
         cards: [BlueprintCard],
         paletteLight: BlueprintPalette?,
         paletteDark: BlueprintPalette?,
         preferredWidth: Int,
         showHorizontalDividers: Bool
    ) {
        self.cards = cards
        self.paletteLight = paletteLight
        self.paletteDark = paletteDark
        self.preferredWidth = preferredWidth
        self.showHorizontalDividers = showHorizontalDividers
    }

    public init?(data: Data) {
        if let proto = try? ProtoColumn(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoColumn) {
        self.cards = proto.cards.compactMap { BlueprintCard(proto: $0) }
        if proto.hasPaletteLight {
            self.paletteLight = BlueprintPalette(proto: proto.paletteLight)
        } else {
            self.paletteLight = nil
        }
        if proto.hasPaletteDark {
            self.paletteDark = BlueprintPalette(proto: proto.paletteDark)
        } else {
            self.paletteDark = nil
        }
        self.preferredWidth = Int(exactly: proto.preferredWidth)!
        if proto.hasShowHorizontalDividers {
            self.showHorizontalDividers = proto.showHorizontalDividers
        } else {
            self.showHorizontalDividers = false
        }
    }
}

public struct BlueprintCompetitionWithMatchDays: Hashable, Equatable, Sendable {

    // The match days for the league
    public let matchDays: [BlueprintMatchDay]

    // The name of the competition, i.e "Premier League"
    public let competitionName: String
    public private(set) var _backingData: Data?

    public init(
         matchDays: [BlueprintMatchDay],
         competitionName: String
    ) {
        self.matchDays = matchDays
        self.competitionName = competitionName
    }

    public init?(data: Data) {
        if let proto = try? ProtoCompetitionWithMatchDays(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoCompetitionWithMatchDays) {
        self.matchDays = proto.matchDays.compactMap { BlueprintMatchDay(proto: $0) }
        self.competitionName = proto.competitionName
    }
}

public struct BlueprintFollowUp: Hashable, Equatable, Sendable {
    public let type: BlueprintFollowUpType
    public let uri: URL

    // At the time of creation MAPI couldn't support blueprint versions of the
    // follow-on link so this field was marked as optional. As part of the
    // migration work, MAPI will eventually support blueprint endpoints for all
    // follow on links.
    public let blueprintUri: URL?
    public private(set) var _backingData: Data?

    public init(
         type: BlueprintFollowUpType,
         uri: URL,
         blueprintUri: URL?
    ) {
        self.type = type
        self.uri = uri
        self.blueprintUri = blueprintUri
    }

    public init?(data: Data) {
        if let proto = try? ProtoFollowUp(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoFollowUp) {
        if let type = BlueprintFollowUpType(proto: proto.type) {
            self.type = type
        } else {
            return nil
        }
        if let uri = URL(string: proto.uri) {
            self.uri = uri
        } else {
            return nil
        }
        if proto.hasBlueprintUri {
            self.blueprintUri = URL(string: proto.blueprintUri)
        } else {
            self.blueprintUri = nil
        }
    }
}

public struct BlueprintHeader: Hashable, Equatable, Sendable {
    public let headerText: String
    public let description: String?
    public let alignment: BlueprintHeaderType
    public let paletteLight: BlueprintPalette?
    public let paletteDark: BlueprintPalette?
    public let image: BlueprintImage?
    public let profileImage: BlueprintImage?
    public let descriptionHtml: String?
    public private(set) var _backingData: Data?

    public init(
         headerText: String,
         description: String?,
         alignment: BlueprintHeaderType,
         paletteLight: BlueprintPalette?,
         paletteDark: BlueprintPalette?,
         image: BlueprintImage?,
         profileImage: BlueprintImage?,
         descriptionHtml: String?
    ) {
        self.headerText = headerText
        self.description = description
        self.alignment = alignment
        self.paletteLight = paletteLight
        self.paletteDark = paletteDark
        self.image = image
        self.profileImage = profileImage
        self.descriptionHtml = descriptionHtml
    }

    public init?(data: Data) {
        if let proto = try? ProtoHeader(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoHeader) {
        self.headerText = proto.headerText
        if proto.hasDescription_p {
            self.description = proto.description_p
        } else {
            self.description = nil
        }
        if let alignment = BlueprintHeaderType(proto: proto.alignment) {
            self.alignment = alignment
        } else {
            return nil
        }
        if proto.hasPaletteLight {
            self.paletteLight = BlueprintPalette(proto: proto.paletteLight)
        } else {
            self.paletteLight = nil
        }
        if proto.hasPaletteDark {
            self.paletteDark = BlueprintPalette(proto: proto.paletteDark)
        } else {
            self.paletteDark = nil
        }
        if proto.hasImage {
            self.image = BlueprintImage(proto: proto.image)
        } else {
            self.image = nil
        }
        if proto.hasProfileImage {
            self.profileImage = BlueprintImage(proto: proto.profileImage)
        } else {
            self.profileImage = nil
        }
        if proto.hasDescriptionHtml {
            self.descriptionHtml = proto.descriptionHtml
        } else {
            self.descriptionHtml = nil
        }
    }
}

public struct BlueprintImage: Hashable, Equatable, Sendable {
    public let altText: String?
    public let caption: String?
    public let credit: String?
    public let height: Int?
    public let urlTemplate: String
    public let width: Int?
    public private(set) var _backingData: Data?

    public init(
         altText: String?,
         caption: String?,
         credit: String?,
         height: Int?,
         urlTemplate: String,
         width: Int?
    ) {
        self.altText = altText
        self.caption = caption
        self.credit = credit
        self.height = height
        self.urlTemplate = urlTemplate
        self.width = width
    }

    public init?(data: Data) {
        if let proto = try? ProtoImage(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoImage) {
        if proto.hasAltText {
            self.altText = proto.altText
        } else {
            self.altText = nil
        }
        if proto.hasCaption {
            self.caption = proto.caption
        } else {
            self.caption = nil
        }
        if proto.hasCredit {
            self.credit = proto.credit
        } else {
            self.credit = nil
        }
        if proto.hasHeight {
            self.height = Int(exactly: proto.height)!
        } else {
            self.height = nil
        }
        self.urlTemplate = proto.urlTemplate
        if proto.hasWidth {
            self.width = Int(exactly: proto.width)!
        } else {
            self.width = nil
        }
    }
}

public struct BlueprintLayoutAgnosticCollection: Hashable, Equatable, Sendable {
    public let id: String

    // A palette at the collection level is currently mapped from MAPI's
    // "navigation style". It's specified when the look and feel of an entire
    // container should be changed, for example when a container is "branded"
    // because the content has been paid for.
    public let paletteLight: BlueprintPalette?
    public let paletteDark: BlueprintPalette?

    // Here we return a list of cards instead of rows. This means that
    // the client will need to decide how to layout the cards.
    public let cards: [BlueprintCard]
    public let title: String?
    public let followUp: BlueprintFollowUp?

    // The property gives the ID of the collection to be used in
    // the tracking data.
    public let trackingID: String?
    public let image: BlueprintImage?
    public private(set) var _backingData: Data?

    public init(
         id: String,
         paletteLight: BlueprintPalette?,
         paletteDark: BlueprintPalette?,
         cards: [BlueprintCard],
         title: String?,
         followUp: BlueprintFollowUp?,
         trackingID: String?,
         image: BlueprintImage?
    ) {
        self.id = id
        self.paletteLight = paletteLight
        self.paletteDark = paletteDark
        self.cards = cards
        self.title = title
        self.followUp = followUp
        self.trackingID = trackingID
        self.image = image
    }

    public init?(data: Data) {
        if let proto = try? ProtoLayoutAgnosticCollection(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoLayoutAgnosticCollection) {
        self.id = proto.id
        if proto.hasPaletteLight {
            self.paletteLight = BlueprintPalette(proto: proto.paletteLight)
        } else {
            self.paletteLight = nil
        }
        if proto.hasPaletteDark {
            self.paletteDark = BlueprintPalette(proto: proto.paletteDark)
        } else {
            self.paletteDark = nil
        }
        self.cards = proto.cards.compactMap { BlueprintCard(proto: $0) }
        if proto.hasTitle {
            self.title = proto.title
        } else {
            self.title = nil
        }
        if proto.hasFollowUp {
            self.followUp = BlueprintFollowUp(proto: proto.followUp)
        } else {
            self.followUp = nil
        }
        if proto.hasTrackingID {
            self.trackingID = proto.trackingID
        } else {
            self.trackingID = nil
        }
        if proto.hasImage {
            self.image = BlueprintImage(proto: proto.image)
        } else {
            self.image = nil
        }
    }
}

public struct BlueprintLinks: Hashable, Equatable, Sendable {
    public let relatedUri: URL?
    public let shortURL: URL?
    public let uri: URL
    public let webUri: URL?
    public private(set) var _backingData: Data?

    public init(
         relatedUri: URL?,
         shortURL: URL?,
         uri: URL,
         webUri: URL?
    ) {
        self.relatedUri = relatedUri
        self.shortURL = shortURL
        self.uri = uri
        self.webUri = webUri
    }

    public init?(data: Data) {
        if let proto = try? ProtoLinks(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoLinks) {
        if proto.hasRelatedUri {
            self.relatedUri = URL(string: proto.relatedUri)
        } else {
            self.relatedUri = nil
        }
        if proto.hasShortURL {
            self.shortURL = URL(string: proto.shortURL)
        } else {
            self.shortURL = nil
        }
        if let uri = URL(string: proto.uri) {
            self.uri = uri
        } else {
            return nil
        }
        if proto.hasWebUri {
            self.webUri = URL(string: proto.webUri)
        } else {
            self.webUri = nil
        }
    }
}

public struct BlueprintList: Hashable, Equatable, Sendable {
    public let title: String

    // The native app will call this URL when a user has scrolled to the bottom
    // of the list and wants to load more content.
    public let nextPageURL: URL?
    public let paletteLight: BlueprintPalette?
    public let paletteDark: BlueprintPalette?
    public let rows: [BlueprintRow]
    public let branding: BlueprintBranding?
    public let topics: [BlueprintTopic]
/// This property has been marked as **deprecated** in the proto file
    public let adTargetingPath: String?
    public let previousPageURL: URL?
    public let tracking: BlueprintTracking
    public let adverts: [Int]
    public let myGuardianFollow: BlueprintMyGuardianFollow?
    public let id: String

    // This is only neded for tracking, but keeping out of the tracking
    // message incase that changes
    public let webUri: URL?
    public let adTargetingParams: BlueprintAdTargetingParams

    // Needed on lists and articles. Collections use the adUnit defined
    // in the fronts response (e.g uk/fronts/home)
    public let adUnit: String
    public let lastUpdatedDate: Date?
    public let header: BlueprintHeader?
    public let tightenVerticalSpacing: Bool
    public private(set) var _backingData: Data?

    public init(
         title: String,
         nextPageURL: URL?,
         paletteLight: BlueprintPalette?,
         paletteDark: BlueprintPalette?,
         rows: [BlueprintRow],
         branding: BlueprintBranding?,
         topics: [BlueprintTopic],
         adTargetingPath: String?,
         previousPageURL: URL?,
         tracking: BlueprintTracking,
         adverts: [Int],
         myGuardianFollow: BlueprintMyGuardianFollow?,
         id: String,
         webUri: URL?,
         adTargetingParams: BlueprintAdTargetingParams,
         adUnit: String,
         lastUpdatedDate: Date?,
         header: BlueprintHeader?,
         tightenVerticalSpacing: Bool
    ) {
        self.title = title
        self.nextPageURL = nextPageURL
        self.paletteLight = paletteLight
        self.paletteDark = paletteDark
        self.rows = rows
        self.branding = branding
        self.topics = topics
        self.adTargetingPath = adTargetingPath
        self.previousPageURL = previousPageURL
        self.tracking = tracking
        self.adverts = adverts
        self.myGuardianFollow = myGuardianFollow
        self.id = id
        self.webUri = webUri
        self.adTargetingParams = adTargetingParams
        self.adUnit = adUnit
        self.lastUpdatedDate = lastUpdatedDate
        self.header = header
        self.tightenVerticalSpacing = tightenVerticalSpacing
    }

    public init?(data: Data) {
        if let proto = try? ProtoList(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoList) {
        self.title = proto.title
        if proto.hasNextPageURL {
            self.nextPageURL = URL(string: proto.nextPageURL)
        } else {
            self.nextPageURL = nil
        }
        if proto.hasPaletteLight {
            self.paletteLight = BlueprintPalette(proto: proto.paletteLight)
        } else {
            self.paletteLight = nil
        }
        if proto.hasPaletteDark {
            self.paletteDark = BlueprintPalette(proto: proto.paletteDark)
        } else {
            self.paletteDark = nil
        }
        self.rows = proto.rows.compactMap { BlueprintRow(proto: $0) }
        if proto.hasBranding {
            self.branding = BlueprintBranding(proto: proto.branding)
        } else {
            self.branding = nil
        }
        self.topics = proto.topics.compactMap { BlueprintTopic(proto: $0) }
        if proto.hasAdTargetingPath {
            self.adTargetingPath = proto.adTargetingPath
        } else {
            self.adTargetingPath = nil
        }
        if proto.hasPreviousPageURL {
            self.previousPageURL = URL(string: proto.previousPageURL)
        } else {
            self.previousPageURL = nil
        }
        if let tracking = BlueprintTracking(proto: proto.tracking) {
            self.tracking = tracking
        } else {
            return nil
        }
        self.adverts = proto.adverts.compactMap { Int($0) }
        if proto.hasMyGuardianFollow {
            self.myGuardianFollow = BlueprintMyGuardianFollow(proto: proto.myGuardianFollow)
        } else {
            self.myGuardianFollow = nil
        }
        self.id = proto.id
        if proto.hasWebUri {
            self.webUri = URL(string: proto.webUri)
        } else {
            self.webUri = nil
        }
        if let adTargetingParams = BlueprintAdTargetingParams(proto: proto.adTargetingParams) {
            self.adTargetingParams = adTargetingParams
        } else {
            return nil
        }
        self.adUnit = proto.adUnit
        if proto.hasLastUpdatedDate {
            self.lastUpdatedDate = proto.lastUpdatedDate.date
        } else {
            self.lastUpdatedDate = nil
        }
        if proto.hasHeader {
            self.header = BlueprintHeader(proto: proto.header)
        } else {
            self.header = nil
        }
        if proto.hasTightenVerticalSpacing {
            self.tightenVerticalSpacing = proto.tightenVerticalSpacing
        } else {
            self.tightenVerticalSpacing = false
        }
    }
}

public struct BlueprintListenToArticle: Hashable, Equatable, Sendable {
    public let audioUri: URL
    public let durationInSeconds: Int
    public private(set) var _backingData: Data?

    public init(
         audioUri: URL,
         durationInSeconds: Int
    ) {
        self.audioUri = audioUri
        self.durationInSeconds = durationInSeconds
    }

    public init?(data: Data) {
        if let proto = try? ProtoListenToArticle(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoListenToArticle) {
        if let audioUri = URL(string: proto.audioUri) {
            self.audioUri = audioUri
        } else {
            return nil
        }
        self.durationInSeconds = Int(exactly: proto.durationInSeconds)!
    }
}

public struct BlueprintLiveEvent: Hashable, Equatable, Sendable {
    public let id: String
    public let title: String
    public let body: String
    public let publishedDate: Date?
    public let lastUpdatedDate: Date?
    public private(set) var _backingData: Data?

    public init(
         id: String,
         title: String,
         body: String,
         publishedDate: Date?,
         lastUpdatedDate: Date?
    ) {
        self.id = id
        self.title = title
        self.body = body
        self.publishedDate = publishedDate
        self.lastUpdatedDate = lastUpdatedDate
    }

    public init?(data: Data) {
        if let proto = try? ProtoLiveEvent(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoLiveEvent) {
        self.id = proto.id
        self.title = proto.title
        self.body = proto.body
        if proto.hasPublishedDate {
            self.publishedDate = proto.publishedDate.date
        } else {
            self.publishedDate = nil
        }
        if proto.hasLastUpdatedDate {
            self.lastUpdatedDate = proto.lastUpdatedDate.date
        } else {
            self.lastUpdatedDate = nil
        }
    }
}

public struct BlueprintMatch: Hashable, Equatable, Sendable {
    public let id: String
    public let homeTeam: BlueprintTeam
    public let awayTeam: BlueprintTeam
    public let kickOff: Date

    // The score of the match, i.e "2-1". Optional as the match may not
    // have started yet.
    public let score: String?

    // Could be the status of the match, i.e "FT" for full time
    // or an aggregate score, i.e "2-1" for a two legged match.
    public let matchDetail: String?

    // The URL to retrieve the match report (if it exists),
    // stats and topic for notification.
    public let matchInfoUri: URL?
    public private(set) var _backingData: Data?

    public init(
         id: String,
         homeTeam: BlueprintTeam,
         awayTeam: BlueprintTeam,
         kickOff: Date,
         score: String?,
         matchDetail: String?,
         matchInfoUri: URL?
    ) {
        self.id = id
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.kickOff = kickOff
        self.score = score
        self.matchDetail = matchDetail
        self.matchInfoUri = matchInfoUri
    }

    public init?(data: Data) {
        if let proto = try? ProtoMatch(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoMatch) {
        self.id = proto.id
        if let homeTeam = BlueprintTeam(proto: proto.homeTeam) {
            self.homeTeam = homeTeam
        } else {
            return nil
        }
        if let awayTeam = BlueprintTeam(proto: proto.awayTeam) {
            self.awayTeam = awayTeam
        } else {
            return nil
        }
        self.kickOff = proto.kickOff.date
        if proto.hasScore {
            self.score = proto.score
        } else {
            self.score = nil
        }
        if proto.hasMatchDetail {
            self.matchDetail = proto.matchDetail
        } else {
            self.matchDetail = nil
        }
        if proto.hasMatchInfoUri {
            self.matchInfoUri = URL(string: proto.matchInfoUri)
        } else {
            self.matchInfoUri = nil
        }
    }
}

public struct BlueprintMatchDay: Hashable, Equatable, Sendable {

    // The date of the match day. Will be the start of the day.
    public let date: Date

    // i.e "Premier League" or if live "Premier League live"
    public let matchDayName: String

    // The matches for the competition on the date
    public let matches: [BlueprintMatch]
    public private(set) var _backingData: Data?

    public init(
         date: Date,
         matchDayName: String,
         matches: [BlueprintMatch]
    ) {
        self.date = date
        self.matchDayName = matchDayName
        self.matches = matches
    }

    public init?(data: Data) {
        if let proto = try? ProtoMatchDay(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoMatchDay) {
        self.date = proto.date.date
        self.matchDayName = proto.matchDayName
        self.matches = proto.matches.compactMap { BlueprintMatch(proto: $0) }
    }
}

public struct BlueprintMediaPill: Hashable, Equatable, Sendable {
    public let name: String
    public let icon: String
    public let detail: String
    public private(set) var _backingData: Data?

    public init(
         name: String,
         icon: String,
         detail: String
    ) {
        self.name = name
        self.icon = icon
        self.detail = detail
    }

    public init?(data: Data) {
        if let proto = try? ProtoMediaPill(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoMediaPill) {
        self.name = proto.name
        self.icon = proto.icon
        self.detail = proto.detail
    }
}

public struct BlueprintMyGuardianFollow: Hashable, Equatable, Sendable {
    public let id: String
    public let webTitle: String
    public let type: BlueprintFollowType
    public private(set) var _backingData: Data?

    public init(
         id: String,
         webTitle: String,
         type: BlueprintFollowType
    ) {
        self.id = id
        self.webTitle = webTitle
        self.type = type
    }

    public init?(data: Data) {
        if let proto = try? ProtoMyGuardianFollow(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoMyGuardianFollow) {
        self.id = proto.id
        self.webTitle = proto.webTitle
        if let type = BlueprintFollowType(proto: proto.type) {
            self.type = type
        } else {
            return nil
        }
    }
}

public struct BlueprintPalette: Hashable, Equatable, Sendable {
    public let accentColour: String
    public let background: String
    public let commentCount: String
    public let elementBackground: String
    public let headline: String
    public let immersiveKicker: String
    public let main: String
    public let mediaBackground: String
    public let mediaIcon: String
    public let metaText: String
    public let pill: String
    public let pillar: String
    public let secondary: String
    public let shadow: String
    public let topBorder: String
    public let kickerText: String
    public let mediaPillBackground: String
    public let mediaPillForeground: String
    public private(set) var _backingData: Data?

    public init(
         accentColour: String,
         background: String,
         commentCount: String,
         elementBackground: String,
         headline: String,
         immersiveKicker: String,
         main: String,
         mediaBackground: String,
         mediaIcon: String,
         metaText: String,
         pill: String,
         pillar: String,
         secondary: String,
         shadow: String,
         topBorder: String,
         kickerText: String,
         mediaPillBackground: String,
         mediaPillForeground: String
    ) {
        self.accentColour = accentColour
        self.background = background
        self.commentCount = commentCount
        self.elementBackground = elementBackground
        self.headline = headline
        self.immersiveKicker = immersiveKicker
        self.main = main
        self.mediaBackground = mediaBackground
        self.mediaIcon = mediaIcon
        self.metaText = metaText
        self.pill = pill
        self.pillar = pillar
        self.secondary = secondary
        self.shadow = shadow
        self.topBorder = topBorder
        self.kickerText = kickerText
        self.mediaPillBackground = mediaPillBackground
        self.mediaPillForeground = mediaPillForeground
    }

    public init?(data: Data) {
        if let proto = try? ProtoPalette(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoPalette) {
        self.accentColour = proto.accentColour
        self.background = proto.background
        self.commentCount = proto.commentCount
        self.elementBackground = proto.elementBackground
        self.headline = proto.headline
        self.immersiveKicker = proto.immersiveKicker
        self.main = proto.main
        self.mediaBackground = proto.mediaBackground
        self.mediaIcon = proto.mediaIcon
        self.metaText = proto.metaText
        self.pill = proto.pill
        self.pillar = proto.pillar
        self.secondary = proto.secondary
        self.shadow = proto.shadow
        self.topBorder = proto.topBorder
        self.kickerText = proto.kickerText
        self.mediaPillBackground = proto.mediaPillBackground
        self.mediaPillForeground = proto.mediaPillForeground
    }
}

public struct BlueprintPermutive: Hashable, Equatable, Sendable {
    public let id: String
    public let type: String
    public let title: String?
    public let section: String?
    public let authors: [String]
    public let keywords: [String]
    public let publishedAt: Date?
    public let series: String?
    public private(set) var _backingData: Data?

    public init(
         id: String,
         type: String,
         title: String?,
         section: String?,
         authors: [String],
         keywords: [String],
         publishedAt: Date?,
         series: String?
    ) {
        self.id = id
        self.type = type
        self.title = title
        self.section = section
        self.authors = authors
        self.keywords = keywords
        self.publishedAt = publishedAt
        self.series = series
    }

    public init?(data: Data) {
        if let proto = try? ProtoPermutive(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoPermutive) {
        self.id = proto.id
        self.type = proto.type
        if proto.hasTitle {
            self.title = proto.title
        } else {
            self.title = nil
        }
        if proto.hasSection {
            self.section = proto.section
        } else {
            self.section = nil
        }
        self.authors = proto.authors.compactMap { String($0) }
        self.keywords = proto.keywords.compactMap { String($0) }
        if proto.hasPublishedAt {
            self.publishedAt = proto.publishedAt.date
        } else {
            self.publishedAt = nil
        }
        if proto.hasSeries {
            self.series = proto.series
        } else {
            self.series = nil
        }
    }
}

public struct BlueprintPodcastSeries: Hashable, Equatable, Sendable {
    public let id: String
    public let title: String
    public let url: URL
    public let followUp: BlueprintFollowUp?
    public let image: BlueprintImage?
    public let description: String?
    public let latestEpisode: BlueprintAudio?
    public private(set) var _backingData: Data?

    public init(
         id: String,
         title: String,
         url: URL,
         followUp: BlueprintFollowUp?,
         image: BlueprintImage?,
         description: String?,
         latestEpisode: BlueprintAudio?
    ) {
        self.id = id
        self.title = title
        self.url = url
        self.followUp = followUp
        self.image = image
        self.description = description
        self.latestEpisode = latestEpisode
    }

    public init?(data: Data) {
        if let proto = try? ProtoPodcastSeries(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoPodcastSeries) {
        self.id = proto.id
        self.title = proto.title
        if let url = URL(string: proto.url) {
            self.url = url
        } else {
            return nil
        }
        if proto.hasFollowUp {
            self.followUp = BlueprintFollowUp(proto: proto.followUp)
        } else {
            self.followUp = nil
        }
        if proto.hasImage {
            self.image = BlueprintImage(proto: proto.image)
        } else {
            self.image = nil
        }
        if proto.hasDescription_p {
            self.description = proto.description_p
        } else {
            self.description = nil
        }
        if proto.hasLatestEpisode {
            self.latestEpisode = BlueprintAudio(proto: proto.latestEpisode)
        } else {
            self.latestEpisode = nil
        }
    }
}

public struct BlueprintRenderingPlatformSupport: Hashable, Equatable, Sendable {
    public let minBridgetVersion: String
    public let uri: URL
    public private(set) var _backingData: Data?

    public init(
         minBridgetVersion: String,
         uri: URL
    ) {
        self.minBridgetVersion = minBridgetVersion
        self.uri = uri
    }

    public init?(data: Data) {
        if let proto = try? ProtoRenderingPlatformSupport(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoRenderingPlatformSupport) {
        self.minBridgetVersion = proto.minBridgetVersion
        if let uri = URL(string: proto.uri) {
            self.uri = uri
        } else {
            return nil
        }
    }
}

public struct BlueprintRow: Hashable, Equatable, Sendable {
    public let columns: [BlueprintColumn]

    // Deprecate the palette_light property in a Row as we did
    // not and will not use this property.
    // reserved "palette_light";
    // reserved 2;
    // Deprecate the palette_dark property in a Row as we did
    // not and will not use this property.
    // reserved "palette_dark";
    // reserved 3;
    // Tablet devices support a 4 column display, whereas mobile devices
    // support a 2 column display. If a mobile device receives a row with a
    // preferred number of columns greater than 2, the additional columns are
    // "wrapped" onto an extra row (a bit like CSS flex-wrap).
    public let preferredNumberOfColumns: Int
    public let thrasher: BlueprintThrasher?
    public let type: BlueprintRowType
    public let title: String?

    // When this attribute is true, the spacing in between cards in the row is
    // reduced.
    public let tightenSpacing: Bool

    // Clicking the row title takes users to the page indicated by
    // this attribute.  The row title is not clickable if it is empty.
    public let followUp: BlueprintFollowUp?

    // Deprecated.  It was the old heading style.
    // reserved "heading_style";
    // reserved 10;
    // The property gives the ID for tracking data which is sent by
    // the apps when users tap the row title.
    public let trackingID: String?

    // Control in what style to display the row title.
    public let titleStyle: BlueprintTitleStyle?

    // Decide whether to show vertical dividers in between cards on
    // this row
    public let showVerticalDividers: Bool

    // Decide whether to show horizontal dividers at the top of this row
    public let showHorizontalDividers: Bool
    public private(set) var _backingData: Data?

    public init(
         columns: [BlueprintColumn],
         preferredNumberOfColumns: Int,
         thrasher: BlueprintThrasher?,
         type: BlueprintRowType,
         title: String?,
         tightenSpacing: Bool,
         followUp: BlueprintFollowUp?,
         trackingID: String?,
         titleStyle: BlueprintTitleStyle?,
         showVerticalDividers: Bool,
         showHorizontalDividers: Bool
    ) {
        self.columns = columns
        self.preferredNumberOfColumns = preferredNumberOfColumns
        self.thrasher = thrasher
        self.type = type
        self.title = title
        self.tightenSpacing = tightenSpacing
        self.followUp = followUp
        self.trackingID = trackingID
        self.titleStyle = titleStyle
        self.showVerticalDividers = showVerticalDividers
        self.showHorizontalDividers = showHorizontalDividers
    }

    public init?(data: Data) {
        if let proto = try? ProtoRow(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoRow) {
        self.columns = proto.columns.compactMap { BlueprintColumn(proto: $0) }
        self.preferredNumberOfColumns = Int(exactly: proto.preferredNumberOfColumns)!
        if proto.hasThrasher {
            self.thrasher = BlueprintThrasher(proto: proto.thrasher)
        } else {
            self.thrasher = nil
        }
        if let type = BlueprintRowType(proto: proto.type) {
            self.type = type
        } else {
            return nil
        }
        if proto.hasTitle {
            self.title = proto.title
        } else {
            self.title = nil
        }
        if proto.hasTightenSpacing {
            self.tightenSpacing = proto.tightenSpacing
        } else {
            self.tightenSpacing = false
        }
        if proto.hasFollowUp {
            self.followUp = BlueprintFollowUp(proto: proto.followUp)
        } else {
            self.followUp = nil
        }
        if proto.hasTrackingID {
            self.trackingID = proto.trackingID
        } else {
            self.trackingID = nil
        }
        if proto.hasTitleStyle {
            self.titleStyle = BlueprintTitleStyle(proto: proto.titleStyle)
        } else {
            self.titleStyle = nil
        }
        if proto.hasShowVerticalDividers {
            self.showVerticalDividers = proto.showVerticalDividers
        } else {
            self.showVerticalDividers = false
        }
        if proto.hasShowHorizontalDividers {
            self.showHorizontalDividers = proto.showHorizontalDividers
        } else {
            self.showHorizontalDividers = false
        }
    }
}

public struct BlueprintTable: Hashable, Equatable, Sendable {

    // The group name, for example "Group A". Only useful
    // for competitions with groups.
    public let groupName: String?

    // Each team and their position in the table
    public let teams: [BlueprintTablePosition]
    public private(set) var _backingData: Data?

    public init(
         groupName: String?,
         teams: [BlueprintTablePosition]
    ) {
        self.groupName = groupName
        self.teams = teams
    }

    public init?(data: Data) {
        if let proto = try? ProtoTable(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoTable) {
        if proto.hasGroupName {
            self.groupName = proto.groupName
        } else {
            self.groupName = nil
        }
        self.teams = proto.teams.compactMap { BlueprintTablePosition(proto: $0) }
    }
}

public struct BlueprintTableGroups: Hashable, Equatable, Sendable {

    // The name of the competition, i.e "UEFA Nations League"
    public let competitionName: String

    // The table (or tables) for that league.
    public let tables: [BlueprintTable]
    public private(set) var _backingData: Data?

    public init(
         competitionName: String,
         tables: [BlueprintTable]
    ) {
        self.competitionName = competitionName
        self.tables = tables
    }

    public init?(data: Data) {
        if let proto = try? ProtoTableGroups(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoTableGroups) {
        self.competitionName = proto.competitionName
        self.tables = proto.tables.compactMap { BlueprintTable(proto: $0) }
    }
}

public struct BlueprintTablePosition: Hashable, Equatable, Sendable {

    // A football team
    public let team: BlueprintTeam

    // The team's position in the table, i.e 2 for 2nd place
    public let position: Int

    // The number of games played
    public let played: Int

    // The number of games won
    public let won: Int

    // The number of games drawn
    public let drawn: Int

    // The number of games lost
    public let lost: Int

    // The number of goals scored
    public let goalsFor: Int

    // The number of goals conceded
    public let goalsAgainst: Int

    // The goal difference
    public let goalDifference: Int

    // The number of points
    public let points: Int

    // The recent form of the team
    public let recentForm: [BlueprintForm]

    // Whether to show a divider after this team in the table
    // to illustrate the relegation/promotion line
    public let showDivider: Bool

    // Tells you if a previous game was won, drawn or lost
    // The in-app follow-up if the team is clicked.
    // This will be used to navigate to the tag page for that team
    public let followUp: BlueprintFollowUp?
    public private(set) var _backingData: Data?

    public init(
         team: BlueprintTeam,
         position: Int,
         played: Int,
         won: Int,
         drawn: Int,
         lost: Int,
         goalsFor: Int,
         goalsAgainst: Int,
         goalDifference: Int,
         points: Int,
         recentForm: [BlueprintForm],
         showDivider: Bool,
         followUp: BlueprintFollowUp?
    ) {
        self.team = team
        self.position = position
        self.played = played
        self.won = won
        self.drawn = drawn
        self.lost = lost
        self.goalsFor = goalsFor
        self.goalsAgainst = goalsAgainst
        self.goalDifference = goalDifference
        self.points = points
        self.recentForm = recentForm
        self.showDivider = showDivider
        self.followUp = followUp
    }

    public init?(data: Data) {
        if let proto = try? ProtoTablePosition(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoTablePosition) {
        if let team = BlueprintTeam(proto: proto.team) {
            self.team = team
        } else {
            return nil
        }
        self.position = Int(exactly: proto.position)!
        self.played = Int(exactly: proto.played)!
        self.won = Int(exactly: proto.won)!
        self.drawn = Int(exactly: proto.drawn)!
        self.lost = Int(exactly: proto.lost)!
        self.goalsFor = Int(exactly: proto.goalsFor)!
        self.goalsAgainst = Int(exactly: proto.goalsAgainst)!
        self.goalDifference = Int(exactly: proto.goalDifference)!
        self.points = Int(exactly: proto.points)!
        self.recentForm = proto.recentForm.compactMap { BlueprintForm(proto: $0) }
        self.showDivider = proto.showDivider
        if proto.hasFollowUp {
            self.followUp = BlueprintFollowUp(proto: proto.followUp)
        } else {
            self.followUp = nil
        }
    }
}

public struct BlueprintTeam: Hashable, Equatable, Sendable {

    // Each team will have a unique numerical ID
    public let id: String

    // The name of the team, i.e "Luton Town"
    public let name: String

    // The short code name for the team, i.e "LUT"
    public let shortCode: String

    // The team's crest or flag for countries
    public let crest: BlueprintImage
    public private(set) var _backingData: Data?

    public init(
         id: String,
         name: String,
         shortCode: String,
         crest: BlueprintImage
    ) {
        self.id = id
        self.name = name
        self.shortCode = shortCode
        self.crest = crest
    }

    public init?(data: Data) {
        if let proto = try? ProtoTeam(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoTeam) {
        self.id = proto.id
        self.name = proto.name
        self.shortCode = proto.shortCode
        if let crest = BlueprintImage(proto: proto.crest) {
            self.crest = crest
        } else {
            return nil
        }
    }
}

public struct BlueprintThrasher: Hashable, Equatable, Sendable {
    public let uri: URL
    public private(set) var _backingData: Data?

    public init(
         uri: URL
    ) {
        self.uri = uri
    }

    public init?(data: Data) {
        if let proto = try? ProtoThrasher(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoThrasher) {
        if let uri = URL(string: proto.uri) {
            self.uri = uri
        } else {
            return nil
        }
    }
}

public struct BlueprintTopic: Hashable, Equatable, Sendable {
    public let type: String
    public let name: String
    public let displayName: String
    public private(set) var _backingData: Data?

    public init(
         type: String,
         name: String,
         displayName: String
    ) {
        self.type = type
        self.name = name
        self.displayName = displayName
    }

    public init?(data: Data) {
        if let proto = try? ProtoTopic(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoTopic) {
        self.type = proto.type
        self.name = proto.name
        self.displayName = proto.displayName
    }
}

public struct BlueprintTracking: Hashable, Equatable, Sendable {
    public let permutive: BlueprintPermutive

    // For some lists and articles we return nielsen tracking data
    // depending on the section they belong to
    public let nielsenSection: String?
    public let commissioningDesks: [BlueprintBasicTag]
    public private(set) var _backingData: Data?

    public init(
         permutive: BlueprintPermutive,
         nielsenSection: String?,
         commissioningDesks: [BlueprintBasicTag]
    ) {
        self.permutive = permutive
        self.nielsenSection = nielsenSection
        self.commissioningDesks = commissioningDesks
    }

    public init?(data: Data) {
        if let proto = try? ProtoTracking(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoTracking) {
        if let permutive = BlueprintPermutive(proto: proto.permutive) {
            self.permutive = permutive
        } else {
            return nil
        }
        if proto.hasNielsenSection {
            self.nielsenSection = proto.nielsenSection
        } else {
            self.nielsenSection = nil
        }
        self.commissioningDesks = proto.commissioningDesks.compactMap { BlueprintBasicTag(proto: $0) }
    }
}

public struct BlueprintVideo: Hashable, Equatable, Sendable {
    public let altText: String?
    public let caption: String?
    public let credit: String?
    public let height: Int?
    public let orientation: String?
    public let url: URL
    public let width: Int?
/// This property has been marked as **deprecated** in the proto file
    public let youtubeID: String?
    public let durationInSeconds: Int?
    public let posterImage: BlueprintImage?
    public let isLiveVideo: Bool
    public let videoID: String?
    public let platform: BlueprintPlatform?
    public let isLooping: Bool
    public let isAutoplay: Bool
    public let isInteractive: Bool
    public let showProgressBar: Bool
    public let showSubtitles: Bool
    public let overlayPosition: BlueprintVideoOverlayPosition
    public private(set) var _backingData: Data?

    public init(
         altText: String?,
         caption: String?,
         credit: String?,
         height: Int?,
         orientation: String?,
         url: URL,
         width: Int?,
         youtubeID: String?,
         durationInSeconds: Int?,
         posterImage: BlueprintImage?,
         isLiveVideo: Bool,
         videoID: String?,
         platform: BlueprintPlatform?,
         isLooping: Bool,
         isAutoplay: Bool,
         isInteractive: Bool,
         showProgressBar: Bool,
         showSubtitles: Bool,
         overlayPosition: BlueprintVideoOverlayPosition
    ) {
        self.altText = altText
        self.caption = caption
        self.credit = credit
        self.height = height
        self.orientation = orientation
        self.url = url
        self.width = width
        self.youtubeID = youtubeID
        self.durationInSeconds = durationInSeconds
        self.posterImage = posterImage
        self.isLiveVideo = isLiveVideo
        self.videoID = videoID
        self.platform = platform
        self.isLooping = isLooping
        self.isAutoplay = isAutoplay
        self.isInteractive = isInteractive
        self.showProgressBar = showProgressBar
        self.showSubtitles = showSubtitles
        self.overlayPosition = overlayPosition
    }

    public init?(data: Data) {
        if let proto = try? ProtoVideo(serializedBytes: data) {
            self.init(proto: proto)
            self._backingData = data
        } else {
            return nil
        }
    }

    internal init?(proto: ProtoVideo) {
        if proto.hasAltText {
            self.altText = proto.altText
        } else {
            self.altText = nil
        }
        if proto.hasCaption {
            self.caption = proto.caption
        } else {
            self.caption = nil
        }
        if proto.hasCredit {
            self.credit = proto.credit
        } else {
            self.credit = nil
        }
        if proto.hasHeight {
            self.height = Int(exactly: proto.height)!
        } else {
            self.height = nil
        }
        if proto.hasOrientation {
            self.orientation = proto.orientation
        } else {
            self.orientation = nil
        }
        if let url = URL(string: proto.url) {
            self.url = url
        } else {
            return nil
        }
        if proto.hasWidth {
            self.width = Int(exactly: proto.width)!
        } else {
            self.width = nil
        }
        if proto.hasYoutubeID {
            self.youtubeID = proto.youtubeID
        } else {
            self.youtubeID = nil
        }
        if proto.hasDurationInSeconds {
            self.durationInSeconds = Int(exactly: proto.durationInSeconds)!
        } else {
            self.durationInSeconds = nil
        }
        if proto.hasPosterImage {
            self.posterImage = BlueprintImage(proto: proto.posterImage)
        } else {
            self.posterImage = nil
        }
        self.isLiveVideo = proto.isLiveVideo
        if proto.hasVideoID {
            self.videoID = proto.videoID
        } else {
            self.videoID = nil
        }
        if proto.hasPlatform {
            self.platform = BlueprintPlatform(proto: proto.platform)
        } else {
            self.platform = nil
        }
        self.isLooping = proto.isLooping
        self.isAutoplay = proto.isAutoplay
        self.isInteractive = proto.isInteractive
        self.showProgressBar = proto.showProgressBar
        self.showSubtitles = proto.showSubtitles
        if let overlayPosition = BlueprintVideoOverlayPosition(proto: proto.overlayPosition) {
            self.overlayPosition = overlayPosition
        } else {
            return nil
        }
    }
}

// MARK: - Enums
extension BlueprintCard {
    public enum BlueprintBoostedHeadline: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case standard = 1
        case boosted1 = 2
        case boosted2 = 3
        case boosted3 = 4
        case boosted4 = 5

        internal init?(proto: ProtoCard.BoostedHeadline) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

extension BlueprintCard {
    public enum BlueprintCardSize: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case xSmall = 1
        case small = 2
        case mediumHorizontal = 3
        case mediumVertical = 4
        case large = 5
        case largeHorizontal = 6
        case xLarge = 7
        case highlights = 8
        case xLargeHorizontal = 9

        internal init?(proto: ProtoCard.CardSize) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

extension BlueprintCard {
    public enum BlueprintCardType: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case article = 1
        case podcast = 2
        case video = 3
        case crossword = 4
        case display = 5
        case numbered = 6
        case empty = 7
        case webContent = 8
        case podcastSeries = 9
        case highlight = 10
        case navigation = 11
        case gallery = 12

        internal init?(proto: ProtoCard.CardType) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

extension BlueprintCollection {
    public enum BlueprintCollectionDesign: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case regular = 1
        case podcast = 2
        case titlepiece = 3

        internal init?(proto: ProtoCollection.CollectionDesign) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

extension BlueprintMyGuardianFollow {
    public enum BlueprintFollowType: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case contributor = 1
        case keyword = 2
        case series = 3
        case section = 4
        case newspaperBookSection = 5
        case newspaperBook = 6
        case blog = 7
        case tone = 8
        case publication = 9
        case tracking = 10
        case paidContent = 11
        case campaign = 12
        case type = 13

        internal init?(proto: ProtoMyGuardianFollow.FollowType) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

extension BlueprintFollowUp {
    public enum BlueprintFollowUpType: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case list = 1
        case front = 2
        case inapp = 3

        internal init?(proto: ProtoFollowUp.FollowUpType) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

public enum BlueprintFontWeight: Int, CaseIterable, Hashable, Equatable, Sendable {
    case unspecified = 0
    case standard = 1
    case light = 2

    internal init?(proto: ProtoFontWeight) {
        self.init(rawValue: proto.rawValue)
    }
}

extension BlueprintTablePosition {
    public enum BlueprintForm: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case win = 1
        case draw = 2
        case loss = 3

        internal init?(proto: ProtoTablePosition.Form) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

public enum BlueprintHeaderType: Int, CaseIterable, Hashable, Equatable, Sendable {
    case unspecified = 0
    case centre = 1
    case leading = 2

    internal init?(proto: ProtoHeaderType) {
        self.init(rawValue: proto.rawValue)
    }
}

extension BlueprintCollection {
    public enum BlueprintHeadingStyle: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case hidden = 1
        case regular = 2
        case small = 3

        internal init?(proto: ProtoCollection.HeadingStyle) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

extension BlueprintCard {
    public enum BlueprintHeadlinePosition: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case inline = 1
        case top = 2

        internal init?(proto: ProtoCard.HeadlinePosition) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

public enum BlueprintImageAspectRatio: Int, CaseIterable, Hashable, Equatable, Sendable {
    case unspecified = 0
    case landscape53 = 1
    case landscape54 = 2
    case portrait45 = 3
    case square = 4

    internal init?(proto: ProtoImageAspectRatio) {
        self.init(rawValue: proto.rawValue)
    }
}

public enum BlueprintMediaType: Int, CaseIterable, Hashable, Equatable, Sendable {
    case unspecified = 0
    case video = 1
    case audio = 2
    case image = 3

    internal init?(proto: ProtoMediaType) {
        self.init(rawValue: proto.rawValue)
    }
}

public enum BlueprintNavCardType: Int, CaseIterable, Hashable, Equatable, Sendable {
    case unspecified = 0
    case news = 1
    case sport = 2
    case lifestyle = 3
    case narrative = 4

    internal init?(proto: ProtoNavCardType) {
        self.init(rawValue: proto.rawValue)
    }
}

public enum BlueprintPlatform: Int, CaseIterable, Hashable, Equatable, Sendable {
    case unspecified = 0
    case youtube = 1
    case url = 2

    internal init?(proto: ProtoPlatform) {
        self.init(rawValue: proto.rawValue)
    }
}

extension BlueprintRow {
    public enum BlueprintRowType: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case layout = 1
        case carousel = 2
        case webContent = 3
        case programmaticCarousel = 4

        internal init?(proto: ProtoRow.RowType) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

extension BlueprintCard {
    public enum BlueprintSublinksArrangement: Int, CaseIterable, Hashable, Equatable, Sendable {
        case unspecified = 0
        case vertical = 1
        case horizontal = 2

        internal init?(proto: ProtoCard.SublinksArrangement) {
            self.init(rawValue: proto.rawValue)
        }
    }
}

public enum BlueprintTitleStyle: Int, CaseIterable, Hashable, Equatable, Sendable {
    case unspecified = 0
    case hidden = 1
    case regular = 2
    case small = 3

    internal init?(proto: ProtoTitleStyle) {
        self.init(rawValue: proto.rawValue)
    }
}

public enum BlueprintTopBorderStyle: Int, CaseIterable, Hashable, Equatable, Sendable {
    case unspecified = 0
    case hidden = 1
    case regular = 2

    internal init?(proto: ProtoTopBorderStyle) {
        self.init(rawValue: proto.rawValue)
    }
}

public enum BlueprintVideoOverlayPosition: Int, CaseIterable, Hashable, Equatable, Sendable {
    case unspecified = 0
    case bottom = 1
    case top = 2

    internal init?(proto: ProtoVideoOverlayPosition) {
        self.init(rawValue: proto.rawValue)
    }
}

