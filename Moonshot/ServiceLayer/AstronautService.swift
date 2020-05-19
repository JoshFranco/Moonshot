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
    
    private init() {
        self.knownAstronauts = Bundle.main.decode("astronauts.json")
    }
}
