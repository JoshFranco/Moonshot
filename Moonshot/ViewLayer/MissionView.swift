//
//  MissionView.swift
//  Moonshot
//
//  Created by Josh Franco on 5/19/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding(.top)
                    
     
                    VStack(spacing: 16) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Launch Date:")
                                    .font(.headline)
                                Text(self.mission.formattedLaunchDate)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(self.mission.description)
                            .font(.subheadline)
                        
                        ForEach(self.crew, id: \.role) { crewMember in
                            NavigationLink(destination:
                                AstronautView(astronaut: crewMember.astronaut)
                            ) {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 83, height: 60)
                                        .clipShape(Capsule())
                                        .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                    
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .font(.headline)
                                        Text(crewMember.role)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 4)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    // MARK: - Init
    init(mission: Mission) {
        let knownAstronauts = AstronautService.shared.knownAstronauts
        self.mission = mission
        
        var matches: [CrewMember] = []
        for member in mission.crew {
            guard let match = knownAstronauts.first(where: { $0.id == member.name }) else { continue }
            matches.append(CrewMember(role: member.role, astronaut: match))
        }
        
        self.crew = matches
    }
}

// MARK: - Preview
struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionView(mission: missions[2])
    }
}
