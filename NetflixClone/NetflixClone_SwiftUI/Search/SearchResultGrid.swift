//
//  SearchResultGrid.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/20.
//

import SwiftUI

struct SearchResultGrid: View {
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    let colums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
       
        LazyVGrid(columns: colums, spacing: 10) {
            ForEach(movies, id: \.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(height: 160)
                    .onTapGesture {
                        self.movieDetailToShow = movie
                    }
            }
        }
    }
}

struct SearchResultGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultGrid(movies: generateMovies(20),
                         movieDetailToShow: .constant(nil))
    }
}
