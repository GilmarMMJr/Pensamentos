//
//  Quote.swift
//  Pensamentos
//
//  Created by Gilmar Junior on 15/09/21.
//

import Foundation

struct Quote: Codable {
    
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return " ❝" + quote + "❞ "
    }
    
    var authorFormatted: String {
        return "- " + author + " -"
    }
}
