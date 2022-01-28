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

    func fetch<Query: GraphQLQuery, Item>(
        query: Query,
        mapper: @escaping (GraphQLResult<Query.Data>) -> Item,
        completion: @escaping (Result<Item, Error>)->Void) {
            client.fetch(query: query) { result in
                switch result {
                case let .success(graphQLResult):
                    completion(.success(mapper(graphQLResult)))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        }

}
