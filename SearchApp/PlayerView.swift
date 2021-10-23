//
//  ContentView.swift
//  SearchApp
//
//  Created by Philippe Reichen on 10/22/21.
//

import SwiftUI
import AVKit


struct PlayerView: View {
    let video: Video
    let aspectRatio: CGFloat = 478 / 849
    
    var body: some View {
        
        if let url = URL(string: video.url) {
            
            VStack() {
                Text(video.title)
                
                GeometryReader {
                    geo in VideoPlayer(player: AVPlayer(url: url) )
                        .frame(height: geo.size.width * aspectRatio)
                }
            }
        } else {
            Text("Whoops! Looks like we're having some trouble loading your video right now.")
                .font(.title2)
                .padding()
        }
        
        Text("Hello, world!")
            .padding()
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(video: Video(id: 1, title: "Video Title", url: "https://codewithchris.github.io/Module5Challenge/Lesson%201.mp4"))
    }
}
