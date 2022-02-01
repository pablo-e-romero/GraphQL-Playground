//
//  ApolloFilmsView.swift
//  GraphQL-Playground
//
//  Created by Pablo Romero on 27/1/22.
//

import SwiftUI

struct ApolloFilmsView: View {
    @State var films: [AllFilmsQuery.Data.AllFilm.Film] = []

    var body: some View {
        List(films, id: \.id) { film in
            Text(film.title ?? "Unknown")
        }
        .navigationTitle("Films")
        .onAppear {
            ApolloWrapper.shared.fetchFilms { result in
                self.films = (try? result.get()) ?? []
            }
        }
    }
}

struct ApolloFilmsView_Previews: PreviewProvider {
    static var previews: some View {
        ApolloFilmsView()
    }
}
