//
//  String.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 19/10/25.
//

import Foundation

extension String{
    var formattedMovieDate: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MM/dd/yyyy"
        if let date = formatter.date(from: self){
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        }
        return self
    }
}
