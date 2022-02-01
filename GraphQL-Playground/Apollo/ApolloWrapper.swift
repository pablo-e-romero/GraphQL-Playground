//
//  ApolloWrapper.swift
//  GraphQL-Playground
//
//  Created by Pablo Romero on 27/1/22.
//

import Foundation
import Apollo

final class ApolloWrapper {
    static let shared = ApolloWrapper()

    private let client: ApolloClient

    init() {
        client = .init(url: Constants.backendURL)
    }

    func fetchFilms(completion: @escaping (Result<[AllFilmsQuery.Data.AllFilm.Film], Error>)->Void) {
        client.fetch(query: AllFilmsQuery()) { result in
            let mappedResult: Result<[AllFilmsQuery.Data.AllFilm.Film], Error> = result.map { graphQLResult in
                guard let films = graphQLResult.data?.allFilms?.films else { return [] }
                return films.compactMap({ $0 })
            }

            completion(mappedResult)
        }
    }

}
