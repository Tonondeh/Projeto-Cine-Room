//
//  DataFormatter.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 02/04/21.
//

import Foundation

public func convertData(_ date: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: date)
    dateFormatter.dateFormat = "dd MMM yyyy"
    return  dateFormatter.string(for: date)
    
}
