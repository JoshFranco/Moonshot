//
//  Mission.swift
//  Moonshot
//
//  Created by Josh Franco on 5/19/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let description: String
    let crew: [CrewRole]
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        guard let launchDate = self.launchDate else { return "N/A" }
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        return formatter.string(from: launchDate)
    }
}


