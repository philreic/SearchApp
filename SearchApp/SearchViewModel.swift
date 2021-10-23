//
//  SearchViewModel.swift
//  SearchApp
//
//  Created by Philippe Reichen on 10/22/21.
//

import Foundation

class SearchViewModel: ObservableObject {
    
   var allVideos = [Video]()
    
    @Published var videos = [Video]()
    
    init() {
        
        
        self.getData()
        
    }
    
    func filterVideos(_ searchText: String) {
        
        videos = allVideos.filter({ searchText.isEmpty ? true : $0.title.localizedCaseInsensitiveContains(searchText) })
    }
    func getData() {
        
        guard let url = URL(string: "https://codewithchris.github.io/Module5Challenge/Data.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let videos = try? JSONDecoder().decode([Video].self, from: data) {
                self.allVideos = videos
                
                DispatchQueue.main.async {
                    self.videos = videos
                }
            }
            
            
        }
        .resume()
    }
    
    
}
