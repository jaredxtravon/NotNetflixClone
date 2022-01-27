//
//  MoreLikeThis.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/12.
//

import SwiftUI

struct MoreLikeThis: View {
    
    var movies: [Movie]
    
    let colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        LazyVGrid(columns: colums) {
            
            ForEach(0..<movies.count) { index in
                StandardHomeMovie(movie: movies[index])
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: exampleMovies)
    }
}
