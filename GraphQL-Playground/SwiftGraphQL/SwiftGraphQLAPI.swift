// This file was auto-generated using maticzav/swift-graphql. DO NOT EDIT MANUALLY!
import SwiftGraphQL

// MARK: - Operations

enum Operations {}
extension Objects.Root: GraphQLHttpOperation {
    static var operation: String { "query" }
}

// MARK: - Objects

enum Objects {}
extension Objects {
    struct Root {
        let __typename: TypeName = .root
        let allFilms: [String: Objects.FilmsConnection]
        let allPeople: [String: Objects.PeopleConnection]
        let allPlanets: [String: Objects.PlanetsConnection]
        let allSpecies: [String: Objects.SpeciesConnection]
        let allStarships: [String: Objects.StarshipsConnection]
        let allVehicles: [String: Objects.VehiclesConnection]
        let film: [String: Objects.Film]
        let node: [String: Interfaces.Node]
        let person: [String: Objects.Person]
        let planet: [String: Objects.Planet]
        let species: [String: Objects.Species]
        let starship: [String: Objects.Starship]
        let vehicle: [String: Objects.Vehicle]

        enum TypeName: String, Codable {
            case root = "Root"
        }
    }
}

extension Objects.Root: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "allFilms":
                if let value = try container.decode(Objects.FilmsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "allPeople":
                if let value = try container.decode(Objects.PeopleConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "allPlanets":
                if let value = try container.decode(Objects.PlanetsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "allSpecies":
                if let value = try container.decode(Objects.SpeciesConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "allStarships":
                if let value = try container.decode(Objects.StarshipsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "allVehicles":
                if let value = try container.decode(Objects.VehiclesConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "film":
                if let value = try container.decode(Objects.Film?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Interfaces.Node?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "person":
                if let value = try container.decode(Objects.Person?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "planet":
                if let value = try container.decode(Objects.Planet?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "species":
                if let value = try container.decode(Objects.Species?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "starship":
                if let value = try container.decode(Objects.Starship?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "vehicle":
                if let value = try container.decode(Objects.Vehicle?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        allFilms = map["allFilms"]
        allPeople = map["allPeople"]
        allPlanets = map["allPlanets"]
        allSpecies = map["allSpecies"]
        allStarships = map["allStarships"]
        allVehicles = map["allVehicles"]
        film = map["film"]
        node = map["node"]
        person = map["person"]
        planet = map["planet"]
        species = map["species"]
        starship = map["starship"]
        vehicle = map["vehicle"]
    }
}

extension Fields where TypeLock == Objects.Root {
    func allFilms<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.FilmsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "allFilms",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.allFilms[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func film<Type>(id: OptionalArgument<String> = .absent(), filmId: OptionalArgument<String> = .absent(), selection: Selection<Type, Objects.Film?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "film",
            arguments: [Argument(name: "id", type: "ID", value: id), Argument(name: "filmID", type: "ID", value: filmId)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.film[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func allPeople<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.PeopleConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "allPeople",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.allPeople[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func person<Type>(id: OptionalArgument<String> = .absent(), personId: OptionalArgument<String> = .absent(), selection: Selection<Type, Objects.Person?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "person",
            arguments: [Argument(name: "id", type: "ID", value: id), Argument(name: "personID", type: "ID", value: personId)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.person[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func allPlanets<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.PlanetsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "allPlanets",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.allPlanets[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func planet<Type>(id: OptionalArgument<String> = .absent(), planetId: OptionalArgument<String> = .absent(), selection: Selection<Type, Objects.Planet?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "planet",
            arguments: [Argument(name: "id", type: "ID", value: id), Argument(name: "planetID", type: "ID", value: planetId)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.planet[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func allSpecies<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.SpeciesConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "allSpecies",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.allSpecies[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func species<Type>(id: OptionalArgument<String> = .absent(), speciesId: OptionalArgument<String> = .absent(), selection: Selection<Type, Objects.Species?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "species",
            arguments: [Argument(name: "id", type: "ID", value: id), Argument(name: "speciesID", type: "ID", value: speciesId)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.species[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func allStarships<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.StarshipsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "allStarships",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.allStarships[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func starship<Type>(id: OptionalArgument<String> = .absent(), starshipId: OptionalArgument<String> = .absent(), selection: Selection<Type, Objects.Starship?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "starship",
            arguments: [Argument(name: "id", type: "ID", value: id), Argument(name: "starshipID", type: "ID", value: starshipId)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.starship[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func allVehicles<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.VehiclesConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "allVehicles",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.allVehicles[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func vehicle<Type>(id: OptionalArgument<String> = .absent(), vehicleId: OptionalArgument<String> = .absent(), selection: Selection<Type, Objects.Vehicle?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "vehicle",
            arguments: [Argument(name: "id", type: "ID", value: id), Argument(name: "vehicleID", type: "ID", value: vehicleId)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.vehicle[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// Fetches an object given its ID

    func node<Type>(id: String, selection: Selection<Type, Interfaces.Node?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [Argument(name: "id", type: "ID!", value: id)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Root<T> = Selection<T, Objects.Root>
}

extension Objects {
    struct FilmsConnection {
        let __typename: TypeName = .filmsConnection
        let edges: [String: [Objects.FilmsEdge?]]
        let films: [String: [Objects.Film?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case filmsConnection = "FilmsConnection"
        }
    }
}

extension Objects.FilmsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.FilmsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "films":
                if let value = try container.decode([Objects.Film?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        films = map["films"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.FilmsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.FilmsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func films<Type>(selection: Selection<Type, [Objects.Film?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "films",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.films[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmsConnection<T> = Selection<T, Objects.FilmsConnection>
}

extension Objects {
    struct PageInfo {
        let __typename: TypeName = .pageInfo
        let endCursor: [String: String]
        let hasNextPage: [String: Bool]
        let hasPreviousPage: [String: Bool]
        let startCursor: [String: String]

        enum TypeName: String, Codable {
            case pageInfo = "PageInfo"
        }
    }
}

extension Objects.PageInfo: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "endCursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "hasNextPage":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "hasPreviousPage":
                if let value = try container.decode(Bool?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "startCursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        endCursor = map["endCursor"]
        hasNextPage = map["hasNextPage"]
        hasPreviousPage = map["hasPreviousPage"]
        startCursor = map["startCursor"]
    }
}

extension Fields where TypeLock == Objects.PageInfo {
    /// When paginating forwards, are there more items?

    func hasNextPage() throws -> Bool {
        let field = GraphQLField.leaf(
            name: "hasNextPage",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.hasNextPage[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Bool.mockValue
        }
    }

    /// When paginating backwards, are there more items?

    func hasPreviousPage() throws -> Bool {
        let field = GraphQLField.leaf(
            name: "hasPreviousPage",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.hasPreviousPage[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return Bool.mockValue
        }
    }

    /// When paginating backwards, the cursor to continue.

    func startCursor() throws -> String? {
        let field = GraphQLField.leaf(
            name: "startCursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.startCursor[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// When paginating forwards, the cursor to continue.

    func endCursor() throws -> String? {
        let field = GraphQLField.leaf(
            name: "endCursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.endCursor[field.alias!]
        case .mocking:
            return nil
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PageInfo<T> = Selection<T, Objects.PageInfo>
}

extension Objects {
    struct FilmsEdge {
        let __typename: TypeName = .filmsEdge
        let cursor: [String: String]
        let node: [String: Objects.Film]

        enum TypeName: String, Codable {
            case filmsEdge = "FilmsEdge"
        }
    }
}

extension Objects.FilmsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Film?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.FilmsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Film?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmsEdge<T> = Selection<T, Objects.FilmsEdge>
}

extension Objects {
    struct Film {
        let __typename: TypeName = .film
        let characterConnection: [String: Objects.FilmCharactersConnection]
        let created: [String: String]
        let director: [String: String]
        let edited: [String: String]
        let episodeId: [String: Int]
        let id: [String: String]
        let openingCrawl: [String: String]
        let planetConnection: [String: Objects.FilmPlanetsConnection]
        let producers: [String: [String?]]
        let releaseDate: [String: String]
        let speciesConnection: [String: Objects.FilmSpeciesConnection]
        let starshipConnection: [String: Objects.FilmStarshipsConnection]
        let title: [String: String]
        let vehicleConnection: [String: Objects.FilmVehiclesConnection]

        enum TypeName: String, Codable {
            case film = "Film"
        }
    }
}

extension Objects.Film: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "characterConnection":
                if let value = try container.decode(Objects.FilmCharactersConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "created":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "director":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "edited":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "episodeId":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "id":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "openingCrawl":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "planetConnection":
                if let value = try container.decode(Objects.FilmPlanetsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "producers":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "releaseDate":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "speciesConnection":
                if let value = try container.decode(Objects.FilmSpeciesConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "starshipConnection":
                if let value = try container.decode(Objects.FilmStarshipsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "title":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "vehicleConnection":
                if let value = try container.decode(Objects.FilmVehiclesConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        characterConnection = map["characterConnection"]
        created = map["created"]
        director = map["director"]
        edited = map["edited"]
        episodeId = map["episodeId"]
        id = map["id"]
        openingCrawl = map["openingCrawl"]
        planetConnection = map["planetConnection"]
        producers = map["producers"]
        releaseDate = map["releaseDate"]
        speciesConnection = map["speciesConnection"]
        starshipConnection = map["starshipConnection"]
        title = map["title"]
        vehicleConnection = map["vehicleConnection"]
    }
}

extension Fields where TypeLock == Objects.Film {
    /// The title of this film.

    func title() throws -> String? {
        let field = GraphQLField.leaf(
            name: "title",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.title[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The episode number of this film.

    func episodeId() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "episodeID",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.episodeId[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The opening paragraphs at the beginning of this film.

    func openingCrawl() throws -> String? {
        let field = GraphQLField.leaf(
            name: "openingCrawl",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.openingCrawl[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The name of the director of this film.

    func director() throws -> String? {
        let field = GraphQLField.leaf(
            name: "director",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.director[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The name(s) of the producer(s) of this film.

    func producers() throws -> [String?]? {
        let field = GraphQLField.leaf(
            name: "producers",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.producers[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ISO 8601 date format of film release at original creator country.

    func releaseDate() throws -> String? {
        let field = GraphQLField.leaf(
            name: "releaseDate",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.releaseDate[field.alias!]
        case .mocking:
            return nil
        }
    }

    func speciesConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.FilmSpeciesConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "speciesConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.speciesConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func starshipConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.FilmStarshipsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "starshipConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.starshipConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func vehicleConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.FilmVehiclesConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "vehicleConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.vehicleConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func characterConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.FilmCharactersConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "characterConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.characterConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func planetConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.FilmPlanetsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "planetConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.planetConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// The ISO 8601 date format of the time that this resource was created.

    func created() throws -> String? {
        let field = GraphQLField.leaf(
            name: "created",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.created[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ISO 8601 date format of the time that this resource was edited.

    func edited() throws -> String? {
        let field = GraphQLField.leaf(
            name: "edited",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.edited[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ID of an object

    func id() throws -> String {
        let field = GraphQLField.leaf(
            name: "id",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.id[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Film<T> = Selection<T, Objects.Film>
}

extension Objects {
    struct FilmSpeciesConnection {
        let __typename: TypeName = .filmSpeciesConnection
        let edges: [String: [Objects.FilmSpeciesEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let species: [String: [Objects.Species?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case filmSpeciesConnection = "FilmSpeciesConnection"
        }
    }
}

extension Objects.FilmSpeciesConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.FilmSpeciesEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "species":
                if let value = try container.decode([Objects.Species?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        species = map["species"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.FilmSpeciesConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.FilmSpeciesEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func species<Type>(selection: Selection<Type, [Objects.Species?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "species",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.species[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmSpeciesConnection<T> = Selection<T, Objects.FilmSpeciesConnection>
}

extension Objects {
    struct FilmSpeciesEdge {
        let __typename: TypeName = .filmSpeciesEdge
        let cursor: [String: String]
        let node: [String: Objects.Species]

        enum TypeName: String, Codable {
            case filmSpeciesEdge = "FilmSpeciesEdge"
        }
    }
}

extension Objects.FilmSpeciesEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Species?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.FilmSpeciesEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Species?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmSpeciesEdge<T> = Selection<T, Objects.FilmSpeciesEdge>
}

extension Objects {
    struct Species {
        let __typename: TypeName = .species
        let averageHeight: [String: Double]
        let averageLifespan: [String: Int]
        let classification: [String: String]
        let created: [String: String]
        let designation: [String: String]
        let edited: [String: String]
        let eyeColors: [String: [String?]]
        let filmConnection: [String: Objects.SpeciesFilmsConnection]
        let hairColors: [String: [String?]]
        let homeworld: [String: Objects.Planet]
        let id: [String: String]
        let language: [String: String]
        let name: [String: String]
        let personConnection: [String: Objects.SpeciesPeopleConnection]
        let skinColors: [String: [String?]]

        enum TypeName: String, Codable {
            case species = "Species"
        }
    }
}

extension Objects.Species: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "averageHeight":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "averageLifespan":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "classification":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "created":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "designation":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "edited":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "eyeColors":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "filmConnection":
                if let value = try container.decode(Objects.SpeciesFilmsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "hairColors":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "homeworld":
                if let value = try container.decode(Objects.Planet?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "id":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "language":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "personConnection":
                if let value = try container.decode(Objects.SpeciesPeopleConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "skinColors":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        averageHeight = map["averageHeight"]
        averageLifespan = map["averageLifespan"]
        classification = map["classification"]
        created = map["created"]
        designation = map["designation"]
        edited = map["edited"]
        eyeColors = map["eyeColors"]
        filmConnection = map["filmConnection"]
        hairColors = map["hairColors"]
        homeworld = map["homeworld"]
        id = map["id"]
        language = map["language"]
        name = map["name"]
        personConnection = map["personConnection"]
        skinColors = map["skinColors"]
    }
}

extension Fields where TypeLock == Objects.Species {
    /// The name of this species.

    func name() throws -> String? {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.name[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The classification of this species, such as "mammal" or "reptile".

    func classification() throws -> String? {
        let field = GraphQLField.leaf(
            name: "classification",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.classification[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The designation of this species, such as "sentient".

    func designation() throws -> String? {
        let field = GraphQLField.leaf(
            name: "designation",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.designation[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The average height of this species in centimeters.

    func averageHeight() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "averageHeight",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.averageHeight[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The average lifespan of this species in years, null if unknown.

    func averageLifespan() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "averageLifespan",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.averageLifespan[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// Common eye colors for this species, null if this species does not typically
    /// have eyes.

    func eyeColors() throws -> [String?]? {
        let field = GraphQLField.leaf(
            name: "eyeColors",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.eyeColors[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// Common hair colors for this species, null if this species does not typically
    /// have hair.

    func hairColors() throws -> [String?]? {
        let field = GraphQLField.leaf(
            name: "hairColors",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.hairColors[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// Common skin colors for this species, null if this species does not typically
    /// have skin.

    func skinColors() throws -> [String?]? {
        let field = GraphQLField.leaf(
            name: "skinColors",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.skinColors[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The language commonly spoken by this species.

    func language() throws -> String? {
        let field = GraphQLField.leaf(
            name: "language",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.language[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A planet that this species originates from.

    func homeworld<Type>(selection: Selection<Type, Objects.Planet?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "homeworld",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.homeworld[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func personConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.SpeciesPeopleConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "personConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.personConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func filmConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.SpeciesFilmsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "filmConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.filmConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// The ISO 8601 date format of the time that this resource was created.

    func created() throws -> String? {
        let field = GraphQLField.leaf(
            name: "created",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.created[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ISO 8601 date format of the time that this resource was edited.

    func edited() throws -> String? {
        let field = GraphQLField.leaf(
            name: "edited",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.edited[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ID of an object

    func id() throws -> String {
        let field = GraphQLField.leaf(
            name: "id",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.id[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Species<T> = Selection<T, Objects.Species>
}

extension Objects {
    struct Planet {
        let __typename: TypeName = .planet
        let climates: [String: [String?]]
        let created: [String: String]
        let diameter: [String: Int]
        let edited: [String: String]
        let filmConnection: [String: Objects.PlanetFilmsConnection]
        let gravity: [String: String]
        let id: [String: String]
        let name: [String: String]
        let orbitalPeriod: [String: Int]
        let population: [String: Double]
        let residentConnection: [String: Objects.PlanetResidentsConnection]
        let rotationPeriod: [String: Int]
        let surfaceWater: [String: Double]
        let terrains: [String: [String?]]

        enum TypeName: String, Codable {
            case planet = "Planet"
        }
    }
}

extension Objects.Planet: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "climates":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "created":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "diameter":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "edited":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "filmConnection":
                if let value = try container.decode(Objects.PlanetFilmsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "gravity":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "id":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "orbitalPeriod":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "population":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "residentConnection":
                if let value = try container.decode(Objects.PlanetResidentsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "rotationPeriod":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "surfaceWater":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "terrains":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        climates = map["climates"]
        created = map["created"]
        diameter = map["diameter"]
        edited = map["edited"]
        filmConnection = map["filmConnection"]
        gravity = map["gravity"]
        id = map["id"]
        name = map["name"]
        orbitalPeriod = map["orbitalPeriod"]
        population = map["population"]
        residentConnection = map["residentConnection"]
        rotationPeriod = map["rotationPeriod"]
        surfaceWater = map["surfaceWater"]
        terrains = map["terrains"]
    }
}

extension Fields where TypeLock == Objects.Planet {
    /// The name of this planet.

    func name() throws -> String? {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.name[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The diameter of this planet in kilometers.

    func diameter() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "diameter",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.diameter[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The number of standard hours it takes for this planet to complete a single
    /// rotation on its axis.

    func rotationPeriod() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "rotationPeriod",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.rotationPeriod[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The number of standard days it takes for this planet to complete a single orbit
    /// of its local star.

    func orbitalPeriod() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "orbitalPeriod",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.orbitalPeriod[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A number denoting the gravity of this planet, where "1" is normal or 1 standard
    /// G. "2" is twice or 2 standard Gs. "0.5" is half or 0.5 standard Gs.

    func gravity() throws -> String? {
        let field = GraphQLField.leaf(
            name: "gravity",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.gravity[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The average population of sentient beings inhabiting this planet.

    func population() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "population",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.population[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The climates of this planet.

    func climates() throws -> [String?]? {
        let field = GraphQLField.leaf(
            name: "climates",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.climates[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The terrains of this planet.

    func terrains() throws -> [String?]? {
        let field = GraphQLField.leaf(
            name: "terrains",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.terrains[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The percentage of the planet surface that is naturally occurring water or bodies
    /// of water.

    func surfaceWater() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "surfaceWater",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.surfaceWater[field.alias!]
        case .mocking:
            return nil
        }
    }

    func residentConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.PlanetResidentsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "residentConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.residentConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func filmConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.PlanetFilmsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "filmConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.filmConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// The ISO 8601 date format of the time that this resource was created.

    func created() throws -> String? {
        let field = GraphQLField.leaf(
            name: "created",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.created[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ISO 8601 date format of the time that this resource was edited.

    func edited() throws -> String? {
        let field = GraphQLField.leaf(
            name: "edited",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.edited[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ID of an object

    func id() throws -> String {
        let field = GraphQLField.leaf(
            name: "id",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.id[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Planet<T> = Selection<T, Objects.Planet>
}

extension Objects {
    struct PlanetResidentsConnection {
        let __typename: TypeName = .planetResidentsConnection
        let edges: [String: [Objects.PlanetResidentsEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let residents: [String: [Objects.Person?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case planetResidentsConnection = "PlanetResidentsConnection"
        }
    }
}

extension Objects.PlanetResidentsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.PlanetResidentsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "residents":
                if let value = try container.decode([Objects.Person?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        residents = map["residents"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.PlanetResidentsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.PlanetResidentsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func residents<Type>(selection: Selection<Type, [Objects.Person?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "residents",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.residents[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PlanetResidentsConnection<T> = Selection<T, Objects.PlanetResidentsConnection>
}

extension Objects {
    struct PlanetResidentsEdge {
        let __typename: TypeName = .planetResidentsEdge
        let cursor: [String: String]
        let node: [String: Objects.Person]

        enum TypeName: String, Codable {
            case planetResidentsEdge = "PlanetResidentsEdge"
        }
    }
}

extension Objects.PlanetResidentsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Person?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.PlanetResidentsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Person?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PlanetResidentsEdge<T> = Selection<T, Objects.PlanetResidentsEdge>
}

extension Objects {
    struct Person {
        let __typename: TypeName = .person
        let birthYear: [String: String]
        let created: [String: String]
        let edited: [String: String]
        let eyeColor: [String: String]
        let filmConnection: [String: Objects.PersonFilmsConnection]
        let gender: [String: String]
        let hairColor: [String: String]
        let height: [String: Int]
        let homeworld: [String: Objects.Planet]
        let id: [String: String]
        let mass: [String: Double]
        let name: [String: String]
        let skinColor: [String: String]
        let species: [String: Objects.Species]
        let starshipConnection: [String: Objects.PersonStarshipsConnection]
        let vehicleConnection: [String: Objects.PersonVehiclesConnection]

        enum TypeName: String, Codable {
            case person = "Person"
        }
    }
}

extension Objects.Person: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "birthYear":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "created":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "edited":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "eyeColor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "filmConnection":
                if let value = try container.decode(Objects.PersonFilmsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "gender":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "hairColor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "height":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "homeworld":
                if let value = try container.decode(Objects.Planet?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "id":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "mass":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "skinColor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "species":
                if let value = try container.decode(Objects.Species?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "starshipConnection":
                if let value = try container.decode(Objects.PersonStarshipsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "vehicleConnection":
                if let value = try container.decode(Objects.PersonVehiclesConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        birthYear = map["birthYear"]
        created = map["created"]
        edited = map["edited"]
        eyeColor = map["eyeColor"]
        filmConnection = map["filmConnection"]
        gender = map["gender"]
        hairColor = map["hairColor"]
        height = map["height"]
        homeworld = map["homeworld"]
        id = map["id"]
        mass = map["mass"]
        name = map["name"]
        skinColor = map["skinColor"]
        species = map["species"]
        starshipConnection = map["starshipConnection"]
        vehicleConnection = map["vehicleConnection"]
    }
}

extension Fields where TypeLock == Objects.Person {
    /// The name of this person.

    func name() throws -> String? {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.name[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The birth year of the person, using the in-universe standard of BBY or ABY -
    /// Before the Battle of Yavin or After the Battle of Yavin. The Battle of Yavin is
    /// a battle that occurs at the end of Star Wars episode IV: A New Hope.

    func birthYear() throws -> String? {
        let field = GraphQLField.leaf(
            name: "birthYear",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.birthYear[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The eye color of this person. Will be "unknown" if not known or "n/a" if the
    /// person does not have an eye.

    func eyeColor() throws -> String? {
        let field = GraphQLField.leaf(
            name: "eyeColor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.eyeColor[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The gender of this person. Either "Male", "Female" or "unknown",
    /// "n/a" if the person does not have a gender.

    func gender() throws -> String? {
        let field = GraphQLField.leaf(
            name: "gender",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.gender[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The hair color of this person. Will be "unknown" if not known or "n/a" if the
    /// person does not have hair.

    func hairColor() throws -> String? {
        let field = GraphQLField.leaf(
            name: "hairColor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.hairColor[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The height of the person in centimeters.

    func height() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "height",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.height[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The mass of the person in kilograms.

    func mass() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "mass",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.mass[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The skin color of this person.

    func skinColor() throws -> String? {
        let field = GraphQLField.leaf(
            name: "skinColor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.skinColor[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A planet that this person was born on or inhabits.

    func homeworld<Type>(selection: Selection<Type, Objects.Planet?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "homeworld",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.homeworld[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func filmConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.PersonFilmsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "filmConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.filmConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// The species that this person belongs to, or null if unknown.

    func species<Type>(selection: Selection<Type, Objects.Species?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "species",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.species[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func starshipConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.PersonStarshipsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "starshipConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.starshipConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func vehicleConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.PersonVehiclesConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "vehicleConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.vehicleConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// The ISO 8601 date format of the time that this resource was created.

    func created() throws -> String? {
        let field = GraphQLField.leaf(
            name: "created",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.created[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ISO 8601 date format of the time that this resource was edited.

    func edited() throws -> String? {
        let field = GraphQLField.leaf(
            name: "edited",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.edited[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ID of an object

    func id() throws -> String {
        let field = GraphQLField.leaf(
            name: "id",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.id[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Person<T> = Selection<T, Objects.Person>
}

extension Objects {
    struct PersonFilmsConnection {
        let __typename: TypeName = .personFilmsConnection
        let edges: [String: [Objects.PersonFilmsEdge?]]
        let films: [String: [Objects.Film?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case personFilmsConnection = "PersonFilmsConnection"
        }
    }
}

extension Objects.PersonFilmsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.PersonFilmsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "films":
                if let value = try container.decode([Objects.Film?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        films = map["films"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.PersonFilmsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.PersonFilmsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func films<Type>(selection: Selection<Type, [Objects.Film?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "films",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.films[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PersonFilmsConnection<T> = Selection<T, Objects.PersonFilmsConnection>
}

extension Objects {
    struct PersonFilmsEdge {
        let __typename: TypeName = .personFilmsEdge
        let cursor: [String: String]
        let node: [String: Objects.Film]

        enum TypeName: String, Codable {
            case personFilmsEdge = "PersonFilmsEdge"
        }
    }
}

extension Objects.PersonFilmsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Film?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.PersonFilmsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Film?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PersonFilmsEdge<T> = Selection<T, Objects.PersonFilmsEdge>
}

extension Objects {
    struct PersonStarshipsConnection {
        let __typename: TypeName = .personStarshipsConnection
        let edges: [String: [Objects.PersonStarshipsEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let starships: [String: [Objects.Starship?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case personStarshipsConnection = "PersonStarshipsConnection"
        }
    }
}

extension Objects.PersonStarshipsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.PersonStarshipsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "starships":
                if let value = try container.decode([Objects.Starship?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        starships = map["starships"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.PersonStarshipsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.PersonStarshipsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func starships<Type>(selection: Selection<Type, [Objects.Starship?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "starships",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.starships[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PersonStarshipsConnection<T> = Selection<T, Objects.PersonStarshipsConnection>
}

extension Objects {
    struct PersonStarshipsEdge {
        let __typename: TypeName = .personStarshipsEdge
        let cursor: [String: String]
        let node: [String: Objects.Starship]

        enum TypeName: String, Codable {
            case personStarshipsEdge = "PersonStarshipsEdge"
        }
    }
}

extension Objects.PersonStarshipsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Starship?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.PersonStarshipsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Starship?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PersonStarshipsEdge<T> = Selection<T, Objects.PersonStarshipsEdge>
}

extension Objects {
    struct Starship {
        let __typename: TypeName = .starship
        let mglt: [String: Int]
        let cargoCapacity: [String: Double]
        let consumables: [String: String]
        let costInCredits: [String: Double]
        let created: [String: String]
        let crew: [String: String]
        let edited: [String: String]
        let filmConnection: [String: Objects.StarshipFilmsConnection]
        let hyperdriveRating: [String: Double]
        let id: [String: String]
        let length: [String: Double]
        let manufacturers: [String: [String?]]
        let maxAtmospheringSpeed: [String: Int]
        let model: [String: String]
        let name: [String: String]
        let passengers: [String: String]
        let pilotConnection: [String: Objects.StarshipPilotsConnection]
        let starshipClass: [String: String]

        enum TypeName: String, Codable {
            case starship = "Starship"
        }
    }
}

extension Objects.Starship: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "mglt":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "cargoCapacity":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "consumables":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "costInCredits":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "created":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "crew":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "edited":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "filmConnection":
                if let value = try container.decode(Objects.StarshipFilmsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "hyperdriveRating":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "id":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "length":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "manufacturers":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "maxAtmospheringSpeed":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "model":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "passengers":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pilotConnection":
                if let value = try container.decode(Objects.StarshipPilotsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "starshipClass":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        mglt = map["mglt"]
        cargoCapacity = map["cargoCapacity"]
        consumables = map["consumables"]
        costInCredits = map["costInCredits"]
        created = map["created"]
        crew = map["crew"]
        edited = map["edited"]
        filmConnection = map["filmConnection"]
        hyperdriveRating = map["hyperdriveRating"]
        id = map["id"]
        length = map["length"]
        manufacturers = map["manufacturers"]
        maxAtmospheringSpeed = map["maxAtmospheringSpeed"]
        model = map["model"]
        name = map["name"]
        passengers = map["passengers"]
        pilotConnection = map["pilotConnection"]
        starshipClass = map["starshipClass"]
    }
}

extension Fields where TypeLock == Objects.Starship {
    /// The name of this starship. The common name, such as "Death Star".

    func name() throws -> String? {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.name[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The model or official name of this starship. Such as "T-65 X-wing" or "DS-1
    /// Orbital Battle Station".

    func model() throws -> String? {
        let field = GraphQLField.leaf(
            name: "model",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.model[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The class of this starship, such as "Starfighter" or "Deep Space Mobile
    /// Battlestation"

    func starshipClass() throws -> String? {
        let field = GraphQLField.leaf(
            name: "starshipClass",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.starshipClass[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The manufacturers of this starship.

    func manufacturers() throws -> [String?]? {
        let field = GraphQLField.leaf(
            name: "manufacturers",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.manufacturers[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The cost of this starship new, in galactic credits.

    func costInCredits() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "costInCredits",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.costInCredits[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The length of this starship in meters.

    func length() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "length",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.length[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The number of personnel needed to run or pilot this starship.

    func crew() throws -> String? {
        let field = GraphQLField.leaf(
            name: "crew",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.crew[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The number of non-essential people this starship can transport.

    func passengers() throws -> String? {
        let field = GraphQLField.leaf(
            name: "passengers",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.passengers[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The maximum speed of this starship in atmosphere. null if this starship is
    /// incapable of atmosphering flight.

    func maxAtmospheringSpeed() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "maxAtmospheringSpeed",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.maxAtmospheringSpeed[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The class of this starships hyperdrive.

    func hyperdriveRating() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "hyperdriveRating",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.hyperdriveRating[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The Maximum number of Megalights this starship can travel in a standard hour.
    /// A "Megalight" is a standard unit of distance and has never been defined before
    /// within the Star Wars universe. This figure is only really useful for measuring
    /// the difference in speed of starships. We can assume it is similar to AU, the
    /// distance between our Sun (Sol) and Earth.

    func mglt() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "MGLT",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.mglt[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The maximum number of kilograms that this starship can transport.

    func cargoCapacity() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "cargoCapacity",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.cargoCapacity[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The maximum length of time that this starship can provide consumables for its
    /// entire crew without having to resupply.

    func consumables() throws -> String? {
        let field = GraphQLField.leaf(
            name: "consumables",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.consumables[field.alias!]
        case .mocking:
            return nil
        }
    }

    func pilotConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.StarshipPilotsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pilotConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.pilotConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func filmConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.StarshipFilmsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "filmConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.filmConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// The ISO 8601 date format of the time that this resource was created.

    func created() throws -> String? {
        let field = GraphQLField.leaf(
            name: "created",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.created[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ISO 8601 date format of the time that this resource was edited.

    func edited() throws -> String? {
        let field = GraphQLField.leaf(
            name: "edited",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.edited[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ID of an object

    func id() throws -> String {
        let field = GraphQLField.leaf(
            name: "id",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.id[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Starship<T> = Selection<T, Objects.Starship>
}

extension Objects {
    struct StarshipPilotsConnection {
        let __typename: TypeName = .starshipPilotsConnection
        let edges: [String: [Objects.StarshipPilotsEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let pilots: [String: [Objects.Person?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case starshipPilotsConnection = "StarshipPilotsConnection"
        }
    }
}

extension Objects.StarshipPilotsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.StarshipPilotsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pilots":
                if let value = try container.decode([Objects.Person?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        pilots = map["pilots"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.StarshipPilotsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.StarshipPilotsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func pilots<Type>(selection: Selection<Type, [Objects.Person?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pilots",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.pilots[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias StarshipPilotsConnection<T> = Selection<T, Objects.StarshipPilotsConnection>
}

extension Objects {
    struct StarshipPilotsEdge {
        let __typename: TypeName = .starshipPilotsEdge
        let cursor: [String: String]
        let node: [String: Objects.Person]

        enum TypeName: String, Codable {
            case starshipPilotsEdge = "StarshipPilotsEdge"
        }
    }
}

extension Objects.StarshipPilotsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Person?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.StarshipPilotsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Person?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias StarshipPilotsEdge<T> = Selection<T, Objects.StarshipPilotsEdge>
}

extension Objects {
    struct StarshipFilmsConnection {
        let __typename: TypeName = .starshipFilmsConnection
        let edges: [String: [Objects.StarshipFilmsEdge?]]
        let films: [String: [Objects.Film?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case starshipFilmsConnection = "StarshipFilmsConnection"
        }
    }
}

extension Objects.StarshipFilmsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.StarshipFilmsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "films":
                if let value = try container.decode([Objects.Film?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        films = map["films"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.StarshipFilmsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.StarshipFilmsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func films<Type>(selection: Selection<Type, [Objects.Film?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "films",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.films[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias StarshipFilmsConnection<T> = Selection<T, Objects.StarshipFilmsConnection>
}

extension Objects {
    struct StarshipFilmsEdge {
        let __typename: TypeName = .starshipFilmsEdge
        let cursor: [String: String]
        let node: [String: Objects.Film]

        enum TypeName: String, Codable {
            case starshipFilmsEdge = "StarshipFilmsEdge"
        }
    }
}

extension Objects.StarshipFilmsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Film?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.StarshipFilmsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Film?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias StarshipFilmsEdge<T> = Selection<T, Objects.StarshipFilmsEdge>
}

extension Objects {
    struct PersonVehiclesConnection {
        let __typename: TypeName = .personVehiclesConnection
        let edges: [String: [Objects.PersonVehiclesEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]
        let vehicles: [String: [Objects.Vehicle?]]

        enum TypeName: String, Codable {
            case personVehiclesConnection = "PersonVehiclesConnection"
        }
    }
}

extension Objects.PersonVehiclesConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.PersonVehiclesEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "vehicles":
                if let value = try container.decode([Objects.Vehicle?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
        vehicles = map["vehicles"]
    }
}

extension Fields where TypeLock == Objects.PersonVehiclesConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.PersonVehiclesEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func vehicles<Type>(selection: Selection<Type, [Objects.Vehicle?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "vehicles",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.vehicles[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PersonVehiclesConnection<T> = Selection<T, Objects.PersonVehiclesConnection>
}

extension Objects {
    struct PersonVehiclesEdge {
        let __typename: TypeName = .personVehiclesEdge
        let cursor: [String: String]
        let node: [String: Objects.Vehicle]

        enum TypeName: String, Codable {
            case personVehiclesEdge = "PersonVehiclesEdge"
        }
    }
}

extension Objects.PersonVehiclesEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Vehicle?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.PersonVehiclesEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Vehicle?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PersonVehiclesEdge<T> = Selection<T, Objects.PersonVehiclesEdge>
}

extension Objects {
    struct Vehicle {
        let __typename: TypeName = .vehicle
        let cargoCapacity: [String: Double]
        let consumables: [String: String]
        let costInCredits: [String: Double]
        let created: [String: String]
        let crew: [String: String]
        let edited: [String: String]
        let filmConnection: [String: Objects.VehicleFilmsConnection]
        let id: [String: String]
        let length: [String: Double]
        let manufacturers: [String: [String?]]
        let maxAtmospheringSpeed: [String: Int]
        let model: [String: String]
        let name: [String: String]
        let passengers: [String: String]
        let pilotConnection: [String: Objects.VehiclePilotsConnection]
        let vehicleClass: [String: String]

        enum TypeName: String, Codable {
            case vehicle = "Vehicle"
        }
    }
}

extension Objects.Vehicle: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cargoCapacity":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "consumables":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "costInCredits":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "created":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "crew":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "edited":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "filmConnection":
                if let value = try container.decode(Objects.VehicleFilmsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "id":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "length":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "manufacturers":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "maxAtmospheringSpeed":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "model":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "passengers":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pilotConnection":
                if let value = try container.decode(Objects.VehiclePilotsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "vehicleClass":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cargoCapacity = map["cargoCapacity"]
        consumables = map["consumables"]
        costInCredits = map["costInCredits"]
        created = map["created"]
        crew = map["crew"]
        edited = map["edited"]
        filmConnection = map["filmConnection"]
        id = map["id"]
        length = map["length"]
        manufacturers = map["manufacturers"]
        maxAtmospheringSpeed = map["maxAtmospheringSpeed"]
        model = map["model"]
        name = map["name"]
        passengers = map["passengers"]
        pilotConnection = map["pilotConnection"]
        vehicleClass = map["vehicleClass"]
    }
}

extension Fields where TypeLock == Objects.Vehicle {
    /// The name of this vehicle. The common name, such as "Sand Crawler" or "Speeder
    /// bike".

    func name() throws -> String? {
        let field = GraphQLField.leaf(
            name: "name",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.name[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The model or official name of this vehicle. Such as "All-Terrain Attack
    /// Transport".

    func model() throws -> String? {
        let field = GraphQLField.leaf(
            name: "model",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.model[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The class of this vehicle, such as "Wheeled" or "Repulsorcraft".

    func vehicleClass() throws -> String? {
        let field = GraphQLField.leaf(
            name: "vehicleClass",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.vehicleClass[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The manufacturers of this vehicle.

    func manufacturers() throws -> [String?]? {
        let field = GraphQLField.leaf(
            name: "manufacturers",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.manufacturers[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The cost of this vehicle new, in Galactic Credits.

    func costInCredits() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "costInCredits",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.costInCredits[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The length of this vehicle in meters.

    func length() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "length",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.length[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The number of personnel needed to run or pilot this vehicle.

    func crew() throws -> String? {
        let field = GraphQLField.leaf(
            name: "crew",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.crew[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The number of non-essential people this vehicle can transport.

    func passengers() throws -> String? {
        let field = GraphQLField.leaf(
            name: "passengers",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.passengers[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The maximum speed of this vehicle in atmosphere.

    func maxAtmospheringSpeed() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "maxAtmospheringSpeed",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.maxAtmospheringSpeed[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The maximum number of kilograms that this vehicle can transport.

    func cargoCapacity() throws -> Double? {
        let field = GraphQLField.leaf(
            name: "cargoCapacity",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.cargoCapacity[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The maximum length of time that this vehicle can provide consumables for its
    /// entire crew without having to resupply.

    func consumables() throws -> String? {
        let field = GraphQLField.leaf(
            name: "consumables",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.consumables[field.alias!]
        case .mocking:
            return nil
        }
    }

    func pilotConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.VehiclePilotsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pilotConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.pilotConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    func filmConnection<Type>(after: OptionalArgument<String> = .absent(), first: OptionalArgument<Int> = .absent(), before: OptionalArgument<String> = .absent(), last: OptionalArgument<Int> = .absent(), selection: Selection<Type, Objects.VehicleFilmsConnection?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "filmConnection",
            arguments: [Argument(name: "after", type: "String", value: after), Argument(name: "first", type: "Int", value: first), Argument(name: "before", type: "String", value: before), Argument(name: "last", type: "Int", value: last)],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.filmConnection[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// The ISO 8601 date format of the time that this resource was created.

    func created() throws -> String? {
        let field = GraphQLField.leaf(
            name: "created",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.created[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ISO 8601 date format of the time that this resource was edited.

    func edited() throws -> String? {
        let field = GraphQLField.leaf(
            name: "edited",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.edited[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// The ID of an object

    func id() throws -> String {
        let field = GraphQLField.leaf(
            name: "id",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.id[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Vehicle<T> = Selection<T, Objects.Vehicle>
}

extension Objects {
    struct VehiclePilotsConnection {
        let __typename: TypeName = .vehiclePilotsConnection
        let edges: [String: [Objects.VehiclePilotsEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let pilots: [String: [Objects.Person?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case vehiclePilotsConnection = "VehiclePilotsConnection"
        }
    }
}

extension Objects.VehiclePilotsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.VehiclePilotsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pilots":
                if let value = try container.decode([Objects.Person?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        pilots = map["pilots"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.VehiclePilotsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.VehiclePilotsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func pilots<Type>(selection: Selection<Type, [Objects.Person?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pilots",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.pilots[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias VehiclePilotsConnection<T> = Selection<T, Objects.VehiclePilotsConnection>
}

extension Objects {
    struct VehiclePilotsEdge {
        let __typename: TypeName = .vehiclePilotsEdge
        let cursor: [String: String]
        let node: [String: Objects.Person]

        enum TypeName: String, Codable {
            case vehiclePilotsEdge = "VehiclePilotsEdge"
        }
    }
}

extension Objects.VehiclePilotsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Person?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.VehiclePilotsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Person?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias VehiclePilotsEdge<T> = Selection<T, Objects.VehiclePilotsEdge>
}

extension Objects {
    struct VehicleFilmsConnection {
        let __typename: TypeName = .vehicleFilmsConnection
        let edges: [String: [Objects.VehicleFilmsEdge?]]
        let films: [String: [Objects.Film?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case vehicleFilmsConnection = "VehicleFilmsConnection"
        }
    }
}

extension Objects.VehicleFilmsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.VehicleFilmsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "films":
                if let value = try container.decode([Objects.Film?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        films = map["films"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.VehicleFilmsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.VehicleFilmsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func films<Type>(selection: Selection<Type, [Objects.Film?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "films",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.films[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias VehicleFilmsConnection<T> = Selection<T, Objects.VehicleFilmsConnection>
}

extension Objects {
    struct VehicleFilmsEdge {
        let __typename: TypeName = .vehicleFilmsEdge
        let cursor: [String: String]
        let node: [String: Objects.Film]

        enum TypeName: String, Codable {
            case vehicleFilmsEdge = "VehicleFilmsEdge"
        }
    }
}

extension Objects.VehicleFilmsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Film?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.VehicleFilmsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Film?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias VehicleFilmsEdge<T> = Selection<T, Objects.VehicleFilmsEdge>
}

extension Objects {
    struct PlanetFilmsConnection {
        let __typename: TypeName = .planetFilmsConnection
        let edges: [String: [Objects.PlanetFilmsEdge?]]
        let films: [String: [Objects.Film?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case planetFilmsConnection = "PlanetFilmsConnection"
        }
    }
}

extension Objects.PlanetFilmsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.PlanetFilmsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "films":
                if let value = try container.decode([Objects.Film?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        films = map["films"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.PlanetFilmsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.PlanetFilmsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func films<Type>(selection: Selection<Type, [Objects.Film?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "films",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.films[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PlanetFilmsConnection<T> = Selection<T, Objects.PlanetFilmsConnection>
}

extension Objects {
    struct PlanetFilmsEdge {
        let __typename: TypeName = .planetFilmsEdge
        let cursor: [String: String]
        let node: [String: Objects.Film]

        enum TypeName: String, Codable {
            case planetFilmsEdge = "PlanetFilmsEdge"
        }
    }
}

extension Objects.PlanetFilmsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Film?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.PlanetFilmsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Film?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PlanetFilmsEdge<T> = Selection<T, Objects.PlanetFilmsEdge>
}

extension Objects {
    struct SpeciesPeopleConnection {
        let __typename: TypeName = .speciesPeopleConnection
        let edges: [String: [Objects.SpeciesPeopleEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let people: [String: [Objects.Person?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case speciesPeopleConnection = "SpeciesPeopleConnection"
        }
    }
}

extension Objects.SpeciesPeopleConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.SpeciesPeopleEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "people":
                if let value = try container.decode([Objects.Person?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        people = map["people"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.SpeciesPeopleConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.SpeciesPeopleEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func people<Type>(selection: Selection<Type, [Objects.Person?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "people",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.people[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SpeciesPeopleConnection<T> = Selection<T, Objects.SpeciesPeopleConnection>
}

extension Objects {
    struct SpeciesPeopleEdge {
        let __typename: TypeName = .speciesPeopleEdge
        let cursor: [String: String]
        let node: [String: Objects.Person]

        enum TypeName: String, Codable {
            case speciesPeopleEdge = "SpeciesPeopleEdge"
        }
    }
}

extension Objects.SpeciesPeopleEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Person?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.SpeciesPeopleEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Person?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SpeciesPeopleEdge<T> = Selection<T, Objects.SpeciesPeopleEdge>
}

extension Objects {
    struct SpeciesFilmsConnection {
        let __typename: TypeName = .speciesFilmsConnection
        let edges: [String: [Objects.SpeciesFilmsEdge?]]
        let films: [String: [Objects.Film?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case speciesFilmsConnection = "SpeciesFilmsConnection"
        }
    }
}

extension Objects.SpeciesFilmsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.SpeciesFilmsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "films":
                if let value = try container.decode([Objects.Film?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        films = map["films"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.SpeciesFilmsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.SpeciesFilmsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func films<Type>(selection: Selection<Type, [Objects.Film?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "films",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.films[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SpeciesFilmsConnection<T> = Selection<T, Objects.SpeciesFilmsConnection>
}

extension Objects {
    struct SpeciesFilmsEdge {
        let __typename: TypeName = .speciesFilmsEdge
        let cursor: [String: String]
        let node: [String: Objects.Film]

        enum TypeName: String, Codable {
            case speciesFilmsEdge = "SpeciesFilmsEdge"
        }
    }
}

extension Objects.SpeciesFilmsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Film?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.SpeciesFilmsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Film?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SpeciesFilmsEdge<T> = Selection<T, Objects.SpeciesFilmsEdge>
}

extension Objects {
    struct FilmStarshipsConnection {
        let __typename: TypeName = .filmStarshipsConnection
        let edges: [String: [Objects.FilmStarshipsEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let starships: [String: [Objects.Starship?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case filmStarshipsConnection = "FilmStarshipsConnection"
        }
    }
}

extension Objects.FilmStarshipsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.FilmStarshipsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "starships":
                if let value = try container.decode([Objects.Starship?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        starships = map["starships"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.FilmStarshipsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.FilmStarshipsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func starships<Type>(selection: Selection<Type, [Objects.Starship?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "starships",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.starships[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmStarshipsConnection<T> = Selection<T, Objects.FilmStarshipsConnection>
}

extension Objects {
    struct FilmStarshipsEdge {
        let __typename: TypeName = .filmStarshipsEdge
        let cursor: [String: String]
        let node: [String: Objects.Starship]

        enum TypeName: String, Codable {
            case filmStarshipsEdge = "FilmStarshipsEdge"
        }
    }
}

extension Objects.FilmStarshipsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Starship?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.FilmStarshipsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Starship?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmStarshipsEdge<T> = Selection<T, Objects.FilmStarshipsEdge>
}

extension Objects {
    struct FilmVehiclesConnection {
        let __typename: TypeName = .filmVehiclesConnection
        let edges: [String: [Objects.FilmVehiclesEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]
        let vehicles: [String: [Objects.Vehicle?]]

        enum TypeName: String, Codable {
            case filmVehiclesConnection = "FilmVehiclesConnection"
        }
    }
}

extension Objects.FilmVehiclesConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.FilmVehiclesEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "vehicles":
                if let value = try container.decode([Objects.Vehicle?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
        vehicles = map["vehicles"]
    }
}

extension Fields where TypeLock == Objects.FilmVehiclesConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.FilmVehiclesEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func vehicles<Type>(selection: Selection<Type, [Objects.Vehicle?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "vehicles",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.vehicles[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmVehiclesConnection<T> = Selection<T, Objects.FilmVehiclesConnection>
}

extension Objects {
    struct FilmVehiclesEdge {
        let __typename: TypeName = .filmVehiclesEdge
        let cursor: [String: String]
        let node: [String: Objects.Vehicle]

        enum TypeName: String, Codable {
            case filmVehiclesEdge = "FilmVehiclesEdge"
        }
    }
}

extension Objects.FilmVehiclesEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Vehicle?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.FilmVehiclesEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Vehicle?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmVehiclesEdge<T> = Selection<T, Objects.FilmVehiclesEdge>
}

extension Objects {
    struct FilmCharactersConnection {
        let __typename: TypeName = .filmCharactersConnection
        let characters: [String: [Objects.Person?]]
        let edges: [String: [Objects.FilmCharactersEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case filmCharactersConnection = "FilmCharactersConnection"
        }
    }
}

extension Objects.FilmCharactersConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "characters":
                if let value = try container.decode([Objects.Person?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "edges":
                if let value = try container.decode([Objects.FilmCharactersEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        characters = map["characters"]
        edges = map["edges"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.FilmCharactersConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.FilmCharactersEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func characters<Type>(selection: Selection<Type, [Objects.Person?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "characters",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.characters[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmCharactersConnection<T> = Selection<T, Objects.FilmCharactersConnection>
}

extension Objects {
    struct FilmCharactersEdge {
        let __typename: TypeName = .filmCharactersEdge
        let cursor: [String: String]
        let node: [String: Objects.Person]

        enum TypeName: String, Codable {
            case filmCharactersEdge = "FilmCharactersEdge"
        }
    }
}

extension Objects.FilmCharactersEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Person?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.FilmCharactersEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Person?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmCharactersEdge<T> = Selection<T, Objects.FilmCharactersEdge>
}

extension Objects {
    struct FilmPlanetsConnection {
        let __typename: TypeName = .filmPlanetsConnection
        let edges: [String: [Objects.FilmPlanetsEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let planets: [String: [Objects.Planet?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case filmPlanetsConnection = "FilmPlanetsConnection"
        }
    }
}

extension Objects.FilmPlanetsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.FilmPlanetsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "planets":
                if let value = try container.decode([Objects.Planet?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        planets = map["planets"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.FilmPlanetsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.FilmPlanetsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func planets<Type>(selection: Selection<Type, [Objects.Planet?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "planets",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.planets[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmPlanetsConnection<T> = Selection<T, Objects.FilmPlanetsConnection>
}

extension Objects {
    struct FilmPlanetsEdge {
        let __typename: TypeName = .filmPlanetsEdge
        let cursor: [String: String]
        let node: [String: Objects.Planet]

        enum TypeName: String, Codable {
            case filmPlanetsEdge = "FilmPlanetsEdge"
        }
    }
}

extension Objects.FilmPlanetsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Planet?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.FilmPlanetsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Planet?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias FilmPlanetsEdge<T> = Selection<T, Objects.FilmPlanetsEdge>
}

extension Objects {
    struct PeopleConnection {
        let __typename: TypeName = .peopleConnection
        let edges: [String: [Objects.PeopleEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let people: [String: [Objects.Person?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case peopleConnection = "PeopleConnection"
        }
    }
}

extension Objects.PeopleConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.PeopleEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "people":
                if let value = try container.decode([Objects.Person?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        people = map["people"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.PeopleConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.PeopleEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func people<Type>(selection: Selection<Type, [Objects.Person?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "people",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.people[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PeopleConnection<T> = Selection<T, Objects.PeopleConnection>
}

extension Objects {
    struct PeopleEdge {
        let __typename: TypeName = .peopleEdge
        let cursor: [String: String]
        let node: [String: Objects.Person]

        enum TypeName: String, Codable {
            case peopleEdge = "PeopleEdge"
        }
    }
}

extension Objects.PeopleEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Person?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.PeopleEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Person?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PeopleEdge<T> = Selection<T, Objects.PeopleEdge>
}

extension Objects {
    struct PlanetsConnection {
        let __typename: TypeName = .planetsConnection
        let edges: [String: [Objects.PlanetsEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let planets: [String: [Objects.Planet?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case planetsConnection = "PlanetsConnection"
        }
    }
}

extension Objects.PlanetsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.PlanetsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "planets":
                if let value = try container.decode([Objects.Planet?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        planets = map["planets"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.PlanetsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.PlanetsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func planets<Type>(selection: Selection<Type, [Objects.Planet?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "planets",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.planets[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PlanetsConnection<T> = Selection<T, Objects.PlanetsConnection>
}

extension Objects {
    struct PlanetsEdge {
        let __typename: TypeName = .planetsEdge
        let cursor: [String: String]
        let node: [String: Objects.Planet]

        enum TypeName: String, Codable {
            case planetsEdge = "PlanetsEdge"
        }
    }
}

extension Objects.PlanetsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Planet?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.PlanetsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Planet?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias PlanetsEdge<T> = Selection<T, Objects.PlanetsEdge>
}

extension Objects {
    struct SpeciesConnection {
        let __typename: TypeName = .speciesConnection
        let edges: [String: [Objects.SpeciesEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let species: [String: [Objects.Species?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case speciesConnection = "SpeciesConnection"
        }
    }
}

extension Objects.SpeciesConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.SpeciesEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "species":
                if let value = try container.decode([Objects.Species?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        species = map["species"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.SpeciesConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.SpeciesEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func species<Type>(selection: Selection<Type, [Objects.Species?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "species",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.species[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SpeciesConnection<T> = Selection<T, Objects.SpeciesConnection>
}

extension Objects {
    struct SpeciesEdge {
        let __typename: TypeName = .speciesEdge
        let cursor: [String: String]
        let node: [String: Objects.Species]

        enum TypeName: String, Codable {
            case speciesEdge = "SpeciesEdge"
        }
    }
}

extension Objects.SpeciesEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Species?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.SpeciesEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Species?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias SpeciesEdge<T> = Selection<T, Objects.SpeciesEdge>
}

extension Objects {
    struct StarshipsConnection {
        let __typename: TypeName = .starshipsConnection
        let edges: [String: [Objects.StarshipsEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let starships: [String: [Objects.Starship?]]
        let totalCount: [String: Int]

        enum TypeName: String, Codable {
            case starshipsConnection = "StarshipsConnection"
        }
    }
}

extension Objects.StarshipsConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.StarshipsEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "starships":
                if let value = try container.decode([Objects.Starship?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        starships = map["starships"]
        totalCount = map["totalCount"]
    }
}

extension Fields where TypeLock == Objects.StarshipsConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.StarshipsEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func starships<Type>(selection: Selection<Type, [Objects.Starship?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "starships",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.starships[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias StarshipsConnection<T> = Selection<T, Objects.StarshipsConnection>
}

extension Objects {
    struct StarshipsEdge {
        let __typename: TypeName = .starshipsEdge
        let cursor: [String: String]
        let node: [String: Objects.Starship]

        enum TypeName: String, Codable {
            case starshipsEdge = "StarshipsEdge"
        }
    }
}

extension Objects.StarshipsEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Starship?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.StarshipsEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Starship?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias StarshipsEdge<T> = Selection<T, Objects.StarshipsEdge>
}

extension Objects {
    struct VehiclesConnection {
        let __typename: TypeName = .vehiclesConnection
        let edges: [String: [Objects.VehiclesEdge?]]
        let pageInfo: [String: Objects.PageInfo]
        let totalCount: [String: Int]
        let vehicles: [String: [Objects.Vehicle?]]

        enum TypeName: String, Codable {
            case vehiclesConnection = "VehiclesConnection"
        }
    }
}

extension Objects.VehiclesConnection: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "edges":
                if let value = try container.decode([Objects.VehiclesEdge?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pageInfo":
                if let value = try container.decode(Objects.PageInfo?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "totalCount":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "vehicles":
                if let value = try container.decode([Objects.Vehicle?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        edges = map["edges"]
        pageInfo = map["pageInfo"]
        totalCount = map["totalCount"]
        vehicles = map["vehicles"]
    }
}

extension Fields where TypeLock == Objects.VehiclesConnection {
    /// Information to aid in pagination.

    func pageInfo<Type>(selection: Selection<Type, Objects.PageInfo>) throws -> Type {
        let field = GraphQLField.composite(
            name: "pageInfo",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.pageInfo[field.alias!] {
                return try selection.decode(data: data)
            }
            throw HttpError.badpayload
        case .mocking:
            return selection.mock()
        }
    }

    /// A list of edges.

    func edges<Type>(selection: Selection<Type, [Objects.VehiclesEdge?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "edges",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.edges[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.

    func totalCount() throws -> Int? {
        let field = GraphQLField.leaf(
            name: "totalCount",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            return data.totalCount[field.alias!]
        case .mocking:
            return nil
        }
    }

    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.

    func vehicles<Type>(selection: Selection<Type, [Objects.Vehicle?]?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "vehicles",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.vehicles[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias VehiclesConnection<T> = Selection<T, Objects.VehiclesConnection>
}

extension Objects {
    struct VehiclesEdge {
        let __typename: TypeName = .vehiclesEdge
        let cursor: [String: String]
        let node: [String: Objects.Vehicle]

        enum TypeName: String, Codable {
            case vehiclesEdge = "VehiclesEdge"
        }
    }
}

extension Objects.VehiclesEdge: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "cursor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "node":
                if let value = try container.decode(Objects.Vehicle?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        cursor = map["cursor"]
        node = map["node"]
    }
}

extension Fields where TypeLock == Objects.VehiclesEdge {
    /// The item at the end of the edge

    func node<Type>(selection: Selection<Type, Objects.Vehicle?>) throws -> Type {
        let field = GraphQLField.composite(
            name: "node",
            arguments: [],
            selection: selection.selection
        )
        select(field)

        switch response {
        case let .decoding(data):
            return try selection.decode(data: data.node[field.alias!])
        case .mocking:
            return selection.mock()
        }
    }

    /// A cursor for use in pagination

    func cursor() throws -> String {
        let field = GraphQLField.leaf(
            name: "cursor",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.cursor[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias VehiclesEdge<T> = Selection<T, Objects.VehiclesEdge>
}

// MARK: - Interfaces

enum Interfaces {}
extension Interfaces {
    struct Node {
        let __typename: TypeName
        let mglt: [String: Int]
        let averageHeight: [String: Double]
        let averageLifespan: [String: Int]
        let birthYear: [String: String]
        let cargoCapacity: [String: Double]
        let characterConnection: [String: Objects.FilmCharactersConnection]
        let classification: [String: String]
        let climates: [String: [String?]]
        let consumables: [String: String]
        let costInCredits: [String: Double]
        let created: [String: String]
        let crew: [String: String]
        let designation: [String: String]
        let diameter: [String: Int]
        let director: [String: String]
        let edited: [String: String]
        let episodeId: [String: Int]
        let eyeColor: [String: String]
        let eyeColors: [String: [String?]]
        let filmConnection: [String: Objects.VehicleFilmsConnection]
        let gender: [String: String]
        let gravity: [String: String]
        let hairColor: [String: String]
        let hairColors: [String: [String?]]
        let height: [String: Int]
        let homeworld: [String: Objects.Planet]
        let hyperdriveRating: [String: Double]
        let id: [String: String]
        let language: [String: String]
        let length: [String: Double]
        let manufacturers: [String: [String?]]
        let mass: [String: Double]
        let maxAtmospheringSpeed: [String: Int]
        let model: [String: String]
        let name: [String: String]
        let openingCrawl: [String: String]
        let orbitalPeriod: [String: Int]
        let passengers: [String: String]
        let personConnection: [String: Objects.SpeciesPeopleConnection]
        let pilotConnection: [String: Objects.VehiclePilotsConnection]
        let planetConnection: [String: Objects.FilmPlanetsConnection]
        let population: [String: Double]
        let producers: [String: [String?]]
        let releaseDate: [String: String]
        let residentConnection: [String: Objects.PlanetResidentsConnection]
        let rotationPeriod: [String: Int]
        let skinColor: [String: String]
        let skinColors: [String: [String?]]
        let species: [String: Objects.Species]
        let speciesConnection: [String: Objects.FilmSpeciesConnection]
        let starshipClass: [String: String]
        let starshipConnection: [String: Objects.PersonStarshipsConnection]
        let surfaceWater: [String: Double]
        let terrains: [String: [String?]]
        let title: [String: String]
        let vehicleClass: [String: String]
        let vehicleConnection: [String: Objects.PersonVehiclesConnection]

        enum TypeName: String, Codable {
            case film = "Film"
            case species = "Species"
            case planet = "Planet"
            case person = "Person"
            case starship = "Starship"
            case vehicle = "Vehicle"
        }
    }
}

extension Interfaces.Node: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var map = HashMap()
        for codingKey in container.allKeys {
            if codingKey.isTypenameKey { continue }

            let alias = codingKey.stringValue
            let field = GraphQLField.getFieldNameFromAlias(alias)

            switch field {
            case "mglt":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "averageHeight":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "averageLifespan":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "birthYear":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "cargoCapacity":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "characterConnection":
                if let value = try container.decode(Objects.FilmCharactersConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "classification":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "climates":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "consumables":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "costInCredits":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "created":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "crew":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "designation":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "diameter":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "director":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "edited":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "episodeId":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "eyeColor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "eyeColors":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "filmConnection":
                if let value = try container.decode(Objects.VehicleFilmsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "gender":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "gravity":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "hairColor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "hairColors":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "height":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "homeworld":
                if let value = try container.decode(Objects.Planet?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "hyperdriveRating":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "id":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "language":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "length":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "manufacturers":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "mass":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "maxAtmospheringSpeed":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "model":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "name":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "openingCrawl":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "orbitalPeriod":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "passengers":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "personConnection":
                if let value = try container.decode(Objects.SpeciesPeopleConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "pilotConnection":
                if let value = try container.decode(Objects.VehiclePilotsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "planetConnection":
                if let value = try container.decode(Objects.FilmPlanetsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "population":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "producers":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "releaseDate":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "residentConnection":
                if let value = try container.decode(Objects.PlanetResidentsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "rotationPeriod":
                if let value = try container.decode(Int?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "skinColor":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "skinColors":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "species":
                if let value = try container.decode(Objects.Species?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "speciesConnection":
                if let value = try container.decode(Objects.FilmSpeciesConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "starshipClass":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "starshipConnection":
                if let value = try container.decode(Objects.PersonStarshipsConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "surfaceWater":
                if let value = try container.decode(Double?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "terrains":
                if let value = try container.decode([String?]?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "title":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "vehicleClass":
                if let value = try container.decode(String?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            case "vehicleConnection":
                if let value = try container.decode(Objects.PersonVehiclesConnection?.self, forKey: codingKey) {
                    map.set(key: field, hash: alias, value: value as Any)
                }
            default:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown key \(field)."
                    )
                )
            }
        }

        __typename = try container.decode(TypeName.self, forKey: DynamicCodingKeys(stringValue: "__typename")!)

        mglt = map["mglt"]
        averageHeight = map["averageHeight"]
        averageLifespan = map["averageLifespan"]
        birthYear = map["birthYear"]
        cargoCapacity = map["cargoCapacity"]
        characterConnection = map["characterConnection"]
        classification = map["classification"]
        climates = map["climates"]
        consumables = map["consumables"]
        costInCredits = map["costInCredits"]
        created = map["created"]
        crew = map["crew"]
        designation = map["designation"]
        diameter = map["diameter"]
        director = map["director"]
        edited = map["edited"]
        episodeId = map["episodeId"]
        eyeColor = map["eyeColor"]
        eyeColors = map["eyeColors"]
        filmConnection = map["filmConnection"]
        gender = map["gender"]
        gravity = map["gravity"]
        hairColor = map["hairColor"]
        hairColors = map["hairColors"]
        height = map["height"]
        homeworld = map["homeworld"]
        hyperdriveRating = map["hyperdriveRating"]
        id = map["id"]
        language = map["language"]
        length = map["length"]
        manufacturers = map["manufacturers"]
        mass = map["mass"]
        maxAtmospheringSpeed = map["maxAtmospheringSpeed"]
        model = map["model"]
        name = map["name"]
        openingCrawl = map["openingCrawl"]
        orbitalPeriod = map["orbitalPeriod"]
        passengers = map["passengers"]
        personConnection = map["personConnection"]
        pilotConnection = map["pilotConnection"]
        planetConnection = map["planetConnection"]
        population = map["population"]
        producers = map["producers"]
        releaseDate = map["releaseDate"]
        residentConnection = map["residentConnection"]
        rotationPeriod = map["rotationPeriod"]
        skinColor = map["skinColor"]
        skinColors = map["skinColors"]
        species = map["species"]
        speciesConnection = map["speciesConnection"]
        starshipClass = map["starshipClass"]
        starshipConnection = map["starshipConnection"]
        surfaceWater = map["surfaceWater"]
        terrains = map["terrains"]
        title = map["title"]
        vehicleClass = map["vehicleClass"]
        vehicleConnection = map["vehicleConnection"]
    }
}

extension Fields where TypeLock == Interfaces.Node {
    /// The id of the object.

    func id() throws -> String {
        let field = GraphQLField.leaf(
            name: "id",
            arguments: []
        )
        select(field)

        switch response {
        case let .decoding(data):
            if let data = data.id[field.alias!] {
                return data
            }
            throw HttpError.badpayload
        case .mocking:
            return String.mockValue
        }
    }
}

extension Fields where TypeLock == Interfaces.Node {
    func on<Type>(film: Selection<Type, Objects.Film>, species: Selection<Type, Objects.Species>, planet: Selection<Type, Objects.Planet>, person: Selection<Type, Objects.Person>, starship: Selection<Type, Objects.Starship>, vehicle: Selection<Type, Objects.Vehicle>) throws -> Type {
        select([GraphQLField.fragment(type: "Film", selection: film.selection), GraphQLField.fragment(type: "Species", selection: species.selection), GraphQLField.fragment(type: "Planet", selection: planet.selection), GraphQLField.fragment(type: "Person", selection: person.selection), GraphQLField.fragment(type: "Starship", selection: starship.selection), GraphQLField.fragment(type: "Vehicle", selection: vehicle.selection)])

        switch response {
        case let .decoding(data):
            switch data.__typename {
            case .film:
                let data = Objects.Film(characterConnection: data.characterConnection, created: data.created, director: data.director, edited: data.edited, episodeId: data.episodeId, id: data.id, openingCrawl: data.openingCrawl, planetConnection: data.planetConnection, producers: data.producers, releaseDate: data.releaseDate, speciesConnection: data.speciesConnection, starshipConnection: data.starshipConnection, title: data.title, vehicleConnection: data.vehicleConnection)
                return try film.decode(data: data)
            case .species:
                let data = Objects.Species(averageHeight: data.averageHeight, averageLifespan: data.averageLifespan, classification: data.classification, created: data.created, designation: data.designation, edited: data.edited, eyeColors: data.eyeColors, filmConnection: data.filmConnection, hairColors: data.hairColors, homeworld: data.homeworld, id: data.id, language: data.language, name: data.name, personConnection: data.personConnection, skinColors: data.skinColors)
                return try species.decode(data: data)
            case .planet:
                let data = Objects.Planet(climates: data.climates, created: data.created, diameter: data.diameter, edited: data.edited, filmConnection: data.filmConnection, gravity: data.gravity, id: data.id, name: data.name, orbitalPeriod: data.orbitalPeriod, population: data.population, residentConnection: data.residentConnection, rotationPeriod: data.rotationPeriod, surfaceWater: data.surfaceWater, terrains: data.terrains)
                return try planet.decode(data: data)
            case .person:
                let data = Objects.Person(birthYear: data.birthYear, created: data.created, edited: data.edited, eyeColor: data.eyeColor, filmConnection: data.filmConnection, gender: data.gender, hairColor: data.hairColor, height: data.height, homeworld: data.homeworld, id: data.id, mass: data.mass, name: data.name, skinColor: data.skinColor, species: data.species, starshipConnection: data.starshipConnection, vehicleConnection: data.vehicleConnection)
                return try person.decode(data: data)
            case .starship:
                let data = Objects.Starship(mglt: data.mglt, cargoCapacity: data.cargoCapacity, consumables: data.consumables, costInCredits: data.costInCredits, created: data.created, crew: data.crew, edited: data.edited, filmConnection: data.filmConnection, hyperdriveRating: data.hyperdriveRating, id: data.id, length: data.length, manufacturers: data.manufacturers, maxAtmospheringSpeed: data.maxAtmospheringSpeed, model: data.model, name: data.name, passengers: data.passengers, pilotConnection: data.pilotConnection, starshipClass: data.starshipClass)
                return try starship.decode(data: data)
            case .vehicle:
                let data = Objects.Vehicle(cargoCapacity: data.cargoCapacity, consumables: data.consumables, costInCredits: data.costInCredits, created: data.created, crew: data.crew, edited: data.edited, filmConnection: data.filmConnection, id: data.id, length: data.length, manufacturers: data.manufacturers, maxAtmospheringSpeed: data.maxAtmospheringSpeed, model: data.model, name: data.name, passengers: data.passengers, pilotConnection: data.pilotConnection, vehicleClass: data.vehicleClass)
                return try vehicle.decode(data: data)
            }
        case .mocking:
            return film.mock()
        }
    }
}

extension Selection where TypeLock == Never, Type == Never {
    typealias Node<T> = Selection<T, Interfaces.Node>
}

// MARK: - Unions

enum Unions {}

// MARK: - Enums

enum Enums {}

// MARK: - Input Objects

enum InputObjects {}
