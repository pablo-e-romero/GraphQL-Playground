//
//  SwiftGraphQLWrapper.swift
//  GraphQL-Playground
//
//  Created by Pablo Romero on 28/1/22.
//

import Foundation
import SwiftGraphQL

final class SwiftGraphQLWrapper {
    static let shared = SwiftGraphQLWrapper()


//    func fetch<Query: Selection, Item>(
//        query: Query,
//        mapper: @escaping (GraphQLResult<Query.Data>) -> Item,
//        completion: @escaping (Result<Item, Error>)->Void) {

    func fetchFilms() {
        let query = Selection.Query {
            let list = try $0
        }

    }
//            Selection.Quer
//            send(
//
//            client.fetch(query: query) { result in
//                switch result {
//                case let .success(graphQLResult):
//                    completion(.success(mapper(graphQLResult)))
//                case let .failure(error):
//                    completion(.failure(error))
//                }
//            }
//        }

}
