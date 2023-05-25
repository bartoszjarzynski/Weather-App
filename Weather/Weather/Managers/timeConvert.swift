//
//  timeConvert.swift
//  Weather
//
//  Created by Magdalena Maloszyc on 03/04/2023.
//

import SwiftUI

func timeConverter(_ timestamp: Double, format: String) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    let time = dateFormatter.string(from: date)
    return time
}
