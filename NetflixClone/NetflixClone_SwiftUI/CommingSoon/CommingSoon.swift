//
//  CommingSoon.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/20.
//

import SwiftUI

struct CommingSoon: View {
    
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil
    @State private var navBarHidden = true
    
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    
    
    @ObservedObject var vm = CommingSoonVM()
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        } else {
            let remove105 = scroll - 105
            
            let active = Int(remove105 / 410) + 1
            activeIndex = Int(active)
        }
    }
    
    
    var body: some View {
        let movies = vm.movies.enumerated().map { $0 }
        
        let scrollTrackingBinding = Binding(
            get: {
                return scrollOffset
            }, set: { newVal in // set을 위해서 body 내부에 Binding을 구현
                scrollOffset = newVal
                updateActiveIndex(fromScroll: newVal)
            })
    
//        NavigationView {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTrackingBinding) {
                        LazyVStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            
                            ForEach(Array(movies), id: \.offset) { (index, movie) in
                                CommingSoonRow(
                                    movie: movie,
                                    movieDetailtoShow: $movieDetailToShow)
                                    .frame(height: 400)
                                    .overlay(
                                        Group {
                                            index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                        }
                                            .animation(.easeIn)
                                        
                                    )
                            }
                        }
                    }
                    .foregroundColor(.white)
                    
                    NavigationLink(
                        destination: Text("Notifications list"),
                        isActive: $showNotificationList,
                        label: {
                            EmptyView()
                        })
                        .navigationTitle("")
                        .navigationBarHidden(navBarHidden)
                        .onReceive(NotificationCenter.default.publisher(
                            for: UIApplication.willEnterForegroundNotification), perform: { _ in
                                self.navBarHidden = true
                            })
                        .onReceive(NotificationCenter.default.publisher(
                            for: UIApplication.willResignActiveNotification), perform: { _ in
                                self.navBarHidden = false
                            })
                }
                
  
            }
        }
//    }
}

struct CommingSoon_Previews: PreviewProvider {
    static var previews: some View {
        
            CommingSoon()
        
    }
}
