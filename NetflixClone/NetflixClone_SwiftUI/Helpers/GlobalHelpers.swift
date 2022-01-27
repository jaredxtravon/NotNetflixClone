//
//  GlobalHelpers.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/07.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTralier1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL)
let exampleTralier2 = Trailer(name: "The Hero's Journey", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL2)
let exampleTralier3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL3)

let exampleTraliers = [exampleTralier1, exampleTralier2, exampleTralier3]

let episode1 = Episode(name: "Beginnings and Endings",
                       season: 1,
                       episodeNumber: 1,
                       thumbnailImageURLString: "https://picsum.photos/300/102",
                       description: "Six months after the disappearances, the polic form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.",
                       length: 53,
                       videoURL: exampleVideoURL)

let episode2 = Episode(name: "Darm",
                       season: 1,
                       episodeNumber: 2,
                       thumbnailImageURLString: "https://picsum.photos/300/103",
                       description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Caludia has an unnerving encounter and Egon visits an old nemesis.",
                       length: 54,
                       videoURL: exampleVideoURL)

let episode3 = Episode(name: "Ghosts",
                       season: 1,
                       episodeNumber: 3,
                       thumbnailImageURLString: "https://picsum.photos/300/104",
                       description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrixh again",
                       length: 56,
                       videoURL: exampleVideoURL)

let episode4 = Episode(name: "Beginnings and Endings",
                       season: 2,
                       episodeNumber: 1,
                       thumbnailImageURLString: "https://picsum.photos/300/105",
                       description: "Six months after the disappearances, the polic form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.",
                       length: 53,
                       videoURL: exampleVideoURL)

let episode5 = Episode(name: "Darm",
                       season: 2,
                       episodeNumber: 2,
                       thumbnailImageURLString: "https://picsum.photos/300/106",
                       description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Caludia has an unnerving encounter and Egon visits an old nemesis.",
                       length: 54,
                       videoURL: exampleVideoURL)

let episode6 = Episode(name: "Ghosts",
                       season: 2,
                       episodeNumber: 3,
                       thumbnailImageURLString: "https://picsum.photos/300/107",
                       description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrixh again",
                       length: 56,
                       videoURL: exampleVideoURL)

var allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnailURL: URL(string:"https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    accentColor: Color.blue,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "바란 보 오다어, 안테 프리제",
    cast: "루이스 호프만, 올리버 마수치, 와르디스 트러벨",
    moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7],
    episodes: allExampleEpisodes,
    trailers: exampleTraliers,
    previewImageName: "darkPreview",
    previewVideoURL: exampleVideoURL)

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailURL: URL(string:"https://picsum.photos/200/300/")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "바란 보 오다어, 안테 프리제",
    cast: "루이스 호프만, 올리버 마수치, 와르디스 트러벨",
    moreLikeThisMovies: [], trailers: exampleTraliers,
    previewImageName: "ozarkPreview",
    previewVideoURL: exampleVideoURL)


let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailURL: URL(string:"https://picsum.photos/200/301")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "바란 보 오다어, 안테 프리제",
    cast: "루이스 호프만, 올리버 마수치, 와르디스 트러벨",
    moreLikeThisMovies: [],
    promotionHeadline: "Best Rated Show", trailers: exampleTraliers,
    previewImageName: "dirtyJohnPreview",
    previewVideoURL: exampleVideoURL)


let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Alone",
    thumbnailURL: URL(string:"https://picsum.photos/200/302")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 4,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "바란 보 오다어, 안테 프리제",
    cast: "루이스 호프만, 올리버 마수치, 와르디스 트러벨",
    moreLikeThisMovies: [],
    promotionHeadline: "New episodes coming soon", trailers: exampleTraliers,
    previewImageName: "travelersPreview",
    previewVideoURL: exampleVideoURL)


let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "Hannibal",
    thumbnailURL: URL(string:"https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 5,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "바란 보 오다어, 안테 프리제",
    cast: "루이스 호프만, 올리버 마수치, 와르디스 트러벨",
    moreLikeThisMovies: [], trailers: exampleTraliers,
    previewImageName: "whiteLinesPreview",
    previewVideoURL: exampleVideoURL)


let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string:"https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "바란 보 오다어, 안테 프리제",
    cast: "루이스 호프만, 올리버 마수치, 와르디스 트러벨",
    moreLikeThisMovies: [],
    promotionHeadline: "Watch Season 6 Now", trailers: exampleTraliers,
    previewImageName: "dirtyJohnPreview",
    previewVideoURL: exampleVideoURL)


let exampleMovie7 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string:"https://picsum.photos/200/305")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "바란 보 오다어, 안테 프리제",
    cast: "루이스 호프만, 올리버 마수치, 와르디스 트러벨",
    moreLikeThisMovies: [],
    promotionHeadline: "Watch Season 6 Now", trailers: exampleTraliers,
    previewImageName: "darkPreview",
    previewVideoURL: exampleVideoURL)


var exampleMovies: [Movie] {
    return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5,
            exampleMovie6]
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "1. 그들의 비밀", description: "2019년의 현재, 어린 소년이 실종된다. 공포와 혼돈에 사로잡힌 작은 마을. 하지만 몇몇 주민에게 이건 낯선 사건이 아니다. 기이하고도 비극적인 과거의 재현일뿐", season: 1, episode: 1)

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors:[Color.black.opacity(0.0),
                                   Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom)
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

// MARK: dismiss Keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil , from: nil, for: nil)
    }
}

extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
