//
//  AstronautService.swift
//  Moonshot
//
//  Created by Josh Franco on 5/19/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import Foundation

struct AstronautService {
    static let shared = AstronautService()
    private(set) var knownAstronauts: [Astronaut] = []
    private(set) var knownMissions: [Mission] = []
    
    private init() {
        self.knownAstronauts = Bundle.main.decode("astronauts.json")
        self.knownMissions = Bundle.main.decode("missions.json")
    }
    
    func getMissions(for astronaut: Astronaut) -> [Mission] {
        var astronautMissions: [Mission] = []
        
        for mission in knownMissions {
            guard mission.crew.contains(where: { $0.name == astronaut.id }) else { continue }
            astronautMissions.append(mission)
        }
        
        return astronautMissions
    }
}
