//
//  SearchView.swift
//  SearchApp
//
//  Created by Philippe Reichen on 10/22/21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var model: SearchViewModel
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView{
            
            List{
                
                SearchBar(text: $searchText)
                
                ForEach(model.videos) {
                    video in NavigationLink(video.title, destination: PlayerView(video: video))
                }
            }
            .navigationBarTitle(Text("All Video"))
            .onChange(of: searchText) {
                text in model.filterVideos(text)
            }
        }
        
  
       
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(model: SearchViewModel())
    }
}
