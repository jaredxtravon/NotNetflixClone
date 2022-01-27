//
//  PreviewViewVM.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/21.
//

import Foundation

class PreviewViewVM: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
