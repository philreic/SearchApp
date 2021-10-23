//
//  SearchAppApp.swift
//  SearchApp
//
//  Created by Philippe Reichen on 10/22/21.
//

import SwiftUI

@main
struct SearchAppApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(model: SearchViewModel())
        }
    }
}
