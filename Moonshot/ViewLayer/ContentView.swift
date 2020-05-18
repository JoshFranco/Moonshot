//
//  ContentView.swift
//  Moonshot
//
//  Created by Josh Franco on 5/18/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(destination: Text("Some Detail View \(row)")) {
                    Text("Row \(row)")
                }
                
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
