//
//  SearchView.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/19.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    @State private var movieDetailToShow: Movie? = nil
    
    
    var body: some View {
        
        let searchTextBinding = Binding {
            // getter
            return searchText
        } set: {
            // setter
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding,
                          isLoading: $vm.isLoading)
                    .padding()
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularList(movies: vm.popularMovies,
                                    movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if vm.viewState == .empty {
                        Text("Your search did not have any results")
                            .bold()
                            .padding(.top, 150)
                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies{
                        
                        VStack {
                            Text("Movies & TV")
                                .bold()
                                .font(.title3)
                                .padding(.leading, 12)
                            Spacer()
                        }
                        
                        SearchResultGrid(movies: vm.searchResults,
                                         movieDetailToShow: $movieDetailToShow)
                    }
                }
                Spacer()
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!,
                            movieDetailToShow: $movieDetailToShow)
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularList: View {
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Searches")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 12)
                Spacer()
            }
            
            LazyVStack {
                ForEach(movies, id: \.id) { movie in
                    PopularMovieView(movie: movie,
                                     movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}
