//
//  PreviewList.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/21.
//

import SwiftUI

struct PreviewList: View {
    var movies: [Movie]
    
    @Binding var currentSelection: Int
    @Binding var isVisible: Bool
    
    @State private var currentTranslation: CGFloat = 0
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let screen = UIScreen.main.bounds
    
    /* 현재 보이는 화면만 비디오 재생을 위한 메소드 */
    func shouldPlayVideo(index: Int) -> Bool {
        if !isVisible {
            return false
        }
        
        if index != currentSelection {
            return false
        }
        
        return true
    }
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PagerView(
                pageCount: movies.count,
                currentIndex: $currentSelection,
                translation: $currentTranslation, externalDragGesture: externalDragGesture) {
                    ForEach(0..<movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                        
                        PreviewView(
                            vm: PreviewViewVM(movie: movie),
                            playVideo: shouldPlayVideo(index: movieIndex))
                            .frame(width: screen.width)
                    }
                }
                .frame(width: screen.width)
        }
    }
}

//struct ExamplePreviewList: View {
//
//    @State private var currentSelection = 0
//    @State private var isVisible = true
//
//    var body: some View {
//        PreviewList(
//            movies: exampleMovies,
//            currentSelection: $currentSelection,
//            isVisible: $isVisible,
//            externalDragGesture: externalDragGesture)
//    }
//}
//
//struct PreviewList_Previews: PreviewProvider {
//    static var previews: some View {
//        ExamplePreviewList()
//    }
//}
