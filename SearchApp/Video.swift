//
//  Video.swift
//  SearchApp
//
//  Created by Philippe Reichen on 10/22/21.
//

import Foundation

struct Video: Decodable, Identifiable {
    var id: Int
    var title: String
    var url: String

}
