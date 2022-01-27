//
//  Trailer.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/12.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
