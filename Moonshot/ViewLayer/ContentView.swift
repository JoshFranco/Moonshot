//
//  ContentView.swift
//  Moonshot
//
//  Created by Josh Franco on 5/18/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingDateInfo = true
    
    let missions: [Mission] = AstronautService.shared.knownMissions
    
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if self.showingDateInfo {
                            Text(mission.formattedLaunchDate)
                                .transition(.opacity)
                        } else {
                            ForEach(mission.crew, id: \.name) { crewMember in
                                HStack {
                                    Text("\(crewMember.role):")
                                    Spacer()
                                    Text(crewMember.name.capitalized)
                                }
                                .transition(.slide)
                            }
                        }
                        
                        
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(action: {
                    withAnimation {
                        self.showingDateInfo.toggle()
                    }
                }) {
                    Image(systemName: showingDateInfo ? "person.and.person": "calendar")
                }
            )
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
