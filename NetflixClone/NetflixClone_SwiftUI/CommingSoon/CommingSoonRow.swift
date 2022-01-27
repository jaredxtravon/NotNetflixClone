//
//  CommingSoonRow.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/20.
//

import SwiftUI
import Kingfisher
import AVKit


struct CommingSoonRow: View {
    var movie: Movie
    
    @Binding var movieDetailtoShow: Movie?
    
    let screen = UIScreen.main.bounds
    
    var player: AVPlayer {
        AVPlayer(url: URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!)
    }
    
    var body: some View {
        VStack {
//            VideoPlayer(player: player)
            Color.blue
                .frame(height: 200)
            
            VStack {
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.self.width / 3, height: 75)
                        .clipped()
                    
                    Spacer()
                    
                    Button(action: {
                        // remind me
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("Remind me")
                        }
                    })
                        .padding(.horizontal)
                    
                    Button(action: {
                        movieDetailtoShow = movie
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("Info")
                        }
                    })
                        .padding(.trailing, 24)
                }
                .font(.caption)
                
                VStack(alignment: .leading) {
                    Text(movie.name)
                        .font(.title2)
                    Text(movie.episodeDescriptionDisplay)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

struct CommingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            CommingSoonRow(
                movie: exampleMovie1,
                movieDetailtoShow: .constant(nil)
            )
        }
    }
}
