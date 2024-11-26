//
//  DateFormatterUtils.swift
//  PodCastTask
//
//  Created by Ahmad on 22/11/2024.
//


import Foundation

struct DateFormatter {
    
    static func formatDate(_ date: Date?) -> String? {
        guard let date = date else { return nil }
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }

    static func formatDuration(_ duration: Int) -> String {
        if duration < 60 {
            // Less than a minute, show in seconds
            return "\(duration) sec"
        } else if duration < 3600 {
            // Less than an hour, show in minutes
            let minutes = duration / 60
            return "\(minutes) min"
        } else {
            // 1 hour or more, show in hours and minutes
            let hours = duration / 3600
            let minutes = (duration % 3600) / 60
            return minutes > 0 ? "\(hours)h \(minutes)m" : "\(hours)h"
        }
    }
}
