//
//  CommingSoonVM.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/20.
//

import Foundation

class CommingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
