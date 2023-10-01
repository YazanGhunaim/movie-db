//
//  String.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import Foundation

extension String {
    func convertToShortDateFormat() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy" // Original format
        return dateFormatter.date(from: self) ?? Date.now
    }
}
