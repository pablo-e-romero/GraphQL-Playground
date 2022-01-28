//
//  ContentView.swift
//  GraphQL-Playground
//
//  Created by Pablo Romero on 10/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ApolloFilmsView()
                } label: {
                    Text("Apollo GraphQL")
                }
            }
            .navigationTitle("GraphQL")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
