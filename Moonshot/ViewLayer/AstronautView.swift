//
//  AstronautView.swift
//  Moonshot
//
//  Created by Josh Franco on 5/19/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let astronautMissions: [Mission]
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .font(.subheadline)
                    
                    ForEach(self.astronautMissions) { mission in
                        NavigationLink(destination:
                            MissionView(mission: mission)
                        ) {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                    .scaledToFit()
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                
                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    // MARK: - Init
    init(for astronaut: Astronaut) {
        self.astronaut = astronaut
        self.astronautMissions = AstronautService.shared.getMissions(for: astronaut)
    }
}

// MARK: - Preview
struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(for: astronauts[7])
    }
}
