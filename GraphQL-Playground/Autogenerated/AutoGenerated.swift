// MARK: - Objects

public struct Root {
    public let allFilms: FilmsConnection?
    public let film: Film?
    public let allPeople: PeopleConnection?
    public let person: Person?
    public let allPlanets: PlanetsConnection?
    public let planet: Planet?
    public let allSpecies: SpeciesConnection?
    public let species: Species?
    public let allStarships: StarshipsConnection?
    public let starship: Starship?
    public let allVehicles: VehiclesConnection?
    public let vehicle: Vehicle?
    /// Fetches an object given its ID
    public let node: Node?
}

/// A connection to a list of items.
public struct FilmsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [FilmsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let films: [Film]?
}

/// Information about pagination in a connection.
public struct PageInfo {
    /// When paginating forwards, are there more items?
    public let hasNextPage: Bool
    /// When paginating backwards, are there more items?
    public let hasPreviousPage: Bool
    /// When paginating backwards, the cursor to continue.
    public let startCursor: String?
    /// When paginating forwards, the cursor to continue.
    public let endCursor: String?
}

/// An edge in a connection.
public struct FilmsEdge {
    /// The item at the end of the edge
    public let node: Film?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A single film.
public struct Film: Node {
    /// The title of this film.
    public let title: String?
    /// The episode number of this film.
    public let episodeID: Int?
    /// The opening paragraphs at the beginning of this film.
    public let openingCrawl: String?
    /// The name of the director of this film.
    public let director: String?
    /// The name(s) of the producer(s) of this film.
    public let producers: [String]?
    /// The ISO 8601 date format of film release at original creator country.
    public let releaseDate: String?
    public let speciesConnection: FilmSpeciesConnection?
    public let starshipConnection: FilmStarshipsConnection?
    public let vehicleConnection: FilmVehiclesConnection?
    public let characterConnection: FilmCharactersConnection?
    public let planetConnection: FilmPlanetsConnection?
    /// The ISO 8601 date format of the time that this resource was created.
    public let created: String?
    /// The ISO 8601 date format of the time that this resource was edited.
    public let edited: String?
    /// The ID of an object
    public let id: String
}

/// A connection to a list of items.
public struct FilmSpeciesConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [FilmSpeciesEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let species: [Species]?
}

/// An edge in a connection.
public struct FilmSpeciesEdge {
    /// The item at the end of the edge
    public let node: Species?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A type of person or character within the Star Wars Universe.
public struct Species: Node {
    /// The name of this species.
    public let name: String?
    /// The classification of this species, such as "mammal" or "reptile".
    public let classification: String?
    /// The designation of this species, such as "sentient".
    public let designation: String?
    /// The average height of this species in centimeters.
    public let averageHeight: Double?
    /// The average lifespan of this species in years, null if unknown.
    public let averageLifespan: Int?
    /// Common eye colors for this species, null if this species does not typically
    /// have eyes.
    public let eyeColors: [String]?
    /// Common hair colors for this species, null if this species does not typically
    /// have hair.
    public let hairColors: [String]?
    /// Common skin colors for this species, null if this species does not typically
    /// have skin.
    public let skinColors: [String]?
    /// The language commonly spoken by this species.
    public let language: String?
    /// A planet that this species originates from.
    public let homeworld: Planet?
    public let personConnection: SpeciesPeopleConnection?
    public let filmConnection: SpeciesFilmsConnection?
    /// The ISO 8601 date format of the time that this resource was created.
    public let created: String?
    /// The ISO 8601 date format of the time that this resource was edited.
    public let edited: String?
    /// The ID of an object
    public let id: String
}

/// A large mass, planet or planetoid in the Star Wars Universe, at the time of
/// 0 ABY.
public struct Planet: Node {
    /// The name of this planet.
    public let name: String?
    /// The diameter of this planet in kilometers.
    public let diameter: Int?
    /// The number of standard hours it takes for this planet to complete a single
    /// rotation on its axis.
    public let rotationPeriod: Int?
    /// The number of standard days it takes for this planet to complete a single orbit
    /// of its local star.
    public let orbitalPeriod: Int?
    /// A number denoting the gravity of this planet, where "1" is normal or 1 standard
    /// G. "2" is twice or 2 standard Gs. "0.5" is half or 0.5 standard Gs.
    public let gravity: String?
    /// The average population of sentient beings inhabiting this planet.
    public let population: Double?
    /// The climates of this planet.
    public let climates: [String]?
    /// The terrains of this planet.
    public let terrains: [String]?
    /// The percentage of the planet surface that is naturally occurring water or bodies
    /// of water.
    public let surfaceWater: Double?
    public let residentConnection: PlanetResidentsConnection?
    public let filmConnection: PlanetFilmsConnection?
    /// The ISO 8601 date format of the time that this resource was created.
    public let created: String?
    /// The ISO 8601 date format of the time that this resource was edited.
    public let edited: String?
    /// The ID of an object
    public let id: String
}

/// A connection to a list of items.
public struct PlanetResidentsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [PlanetResidentsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let residents: [Person]?
}

/// An edge in a connection.
public struct PlanetResidentsEdge {
    /// The item at the end of the edge
    public let node: Person?
    /// A cursor for use in pagination
    public let cursor: String
}

/// An individual person or character within the Star Wars universe.
public struct Person: Node {
    /// The name of this person.
    public let name: String?
    /// The birth year of the person, using the in-universe standard of BBY or ABY -
    /// Before the Battle of Yavin or After the Battle of Yavin. The Battle of Yavin is
    /// a battle that occurs at the end of Star Wars episode IV: A New Hope.
    public let birthYear: String?
    /// The eye color of this person. Will be "unknown" if not known or "n/a" if the
    /// person does not have an eye.
    public let eyeColor: String?
    /// The gender of this person. Either "Male", "Female" or "unknown",
    /// "n/a" if the person does not have a gender.
    public let gender: String?
    /// The hair color of this person. Will be "unknown" if not known or "n/a" if the
    /// person does not have hair.
    public let hairColor: String?
    /// The height of the person in centimeters.
    public let height: Int?
    /// The mass of the person in kilograms.
    public let mass: Double?
    /// The skin color of this person.
    public let skinColor: String?
    /// A planet that this person was born on or inhabits.
    public let homeworld: Planet?
    public let filmConnection: PersonFilmsConnection?
    /// The species that this person belongs to, or null if unknown.
    public let species: Species?
    public let starshipConnection: PersonStarshipsConnection?
    public let vehicleConnection: PersonVehiclesConnection?
    /// The ISO 8601 date format of the time that this resource was created.
    public let created: String?
    /// The ISO 8601 date format of the time that this resource was edited.
    public let edited: String?
    /// The ID of an object
    public let id: String
}

/// A connection to a list of items.
public struct PersonFilmsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [PersonFilmsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let films: [Film]?
}

/// An edge in a connection.
public struct PersonFilmsEdge {
    /// The item at the end of the edge
    public let node: Film?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct PersonStarshipsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [PersonStarshipsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let starships: [Starship]?
}

/// An edge in a connection.
public struct PersonStarshipsEdge {
    /// The item at the end of the edge
    public let node: Starship?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A single transport craft that has hyperdrive capability.
public struct Starship: Node {
    /// The name of this starship. The common name, such as "Death Star".
    public let name: String?
    /// The model or official name of this starship. Such as "T-65 X-wing" or "DS-1
    /// Orbital Battle Station".
    public let model: String?
    /// The class of this starship, such as "Starfighter" or "Deep Space Mobile
    /// Battlestation"
    public let starshipClass: String?
    /// The manufacturers of this starship.
    public let manufacturers: [String]?
    /// The cost of this starship new, in galactic credits.
    public let costInCredits: Double?
    /// The length of this starship in meters.
    public let length: Double?
    /// The number of personnel needed to run or pilot this starship.
    public let crew: String?
    /// The number of non-essential people this starship can transport.
    public let passengers: String?
    /// The maximum speed of this starship in atmosphere. null if this starship is
    /// incapable of atmosphering flight.
    public let maxAtmospheringSpeed: Int?
    /// The class of this starships hyperdrive.
    public let hyperdriveRating: Double?
    /// The Maximum number of Megalights this starship can travel in a standard hour.
    /// A "Megalight" is a standard unit of distance and has never been defined before
    /// within the Star Wars universe. This figure is only really useful for measuring
    /// the difference in speed of starships. We can assume it is similar to AU, the
    /// distance between our Sun (Sol) and Earth.
    public let MGLT: Int?
    /// The maximum number of kilograms that this starship can transport.
    public let cargoCapacity: Double?
    /// The maximum length of time that this starship can provide consumables for its
    /// entire crew without having to resupply.
    public let consumables: String?
    public let pilotConnection: StarshipPilotsConnection?
    public let filmConnection: StarshipFilmsConnection?
    /// The ISO 8601 date format of the time that this resource was created.
    public let created: String?
    /// The ISO 8601 date format of the time that this resource was edited.
    public let edited: String?
    /// The ID of an object
    public let id: String
}

/// A connection to a list of items.
public struct StarshipPilotsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [StarshipPilotsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let pilots: [Person]?
}

/// An edge in a connection.
public struct StarshipPilotsEdge {
    /// The item at the end of the edge
    public let node: Person?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct StarshipFilmsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [StarshipFilmsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let films: [Film]?
}

/// An edge in a connection.
public struct StarshipFilmsEdge {
    /// The item at the end of the edge
    public let node: Film?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct PersonVehiclesConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [PersonVehiclesEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let vehicles: [Vehicle]?
}

/// An edge in a connection.
public struct PersonVehiclesEdge {
    /// The item at the end of the edge
    public let node: Vehicle?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A single transport craft that does not have hyperdrive capability
public struct Vehicle: Node {
    /// The name of this vehicle. The common name, such as "Sand Crawler" or "Speeder
    /// bike".
    public let name: String?
    /// The model or official name of this vehicle. Such as "All-Terrain Attack
    /// Transport".
    public let model: String?
    /// The class of this vehicle, such as "Wheeled" or "Repulsorcraft".
    public let vehicleClass: String?
    /// The manufacturers of this vehicle.
    public let manufacturers: [String]?
    /// The cost of this vehicle new, in Galactic Credits.
    public let costInCredits: Double?
    /// The length of this vehicle in meters.
    public let length: Double?
    /// The number of personnel needed to run or pilot this vehicle.
    public let crew: String?
    /// The number of non-essential people this vehicle can transport.
    public let passengers: String?
    /// The maximum speed of this vehicle in atmosphere.
    public let maxAtmospheringSpeed: Int?
    /// The maximum number of kilograms that this vehicle can transport.
    public let cargoCapacity: Double?
    /// The maximum length of time that this vehicle can provide consumables for its
    /// entire crew without having to resupply.
    public let consumables: String?
    public let pilotConnection: VehiclePilotsConnection?
    public let filmConnection: VehicleFilmsConnection?
    /// The ISO 8601 date format of the time that this resource was created.
    public let created: String?
    /// The ISO 8601 date format of the time that this resource was edited.
    public let edited: String?
    /// The ID of an object
    public let id: String
}

/// A connection to a list of items.
public struct VehiclePilotsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [VehiclePilotsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let pilots: [Person]?
}

/// An edge in a connection.
public struct VehiclePilotsEdge {
    /// The item at the end of the edge
    public let node: Person?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct VehicleFilmsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [VehicleFilmsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let films: [Film]?
}

/// An edge in a connection.
public struct VehicleFilmsEdge {
    /// The item at the end of the edge
    public let node: Film?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct PlanetFilmsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [PlanetFilmsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let films: [Film]?
}

/// An edge in a connection.
public struct PlanetFilmsEdge {
    /// The item at the end of the edge
    public let node: Film?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct SpeciesPeopleConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [SpeciesPeopleEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let people: [Person]?
}

/// An edge in a connection.
public struct SpeciesPeopleEdge {
    /// The item at the end of the edge
    public let node: Person?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct SpeciesFilmsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [SpeciesFilmsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let films: [Film]?
}

/// An edge in a connection.
public struct SpeciesFilmsEdge {
    /// The item at the end of the edge
    public let node: Film?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct FilmStarshipsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [FilmStarshipsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let starships: [Starship]?
}

/// An edge in a connection.
public struct FilmStarshipsEdge {
    /// The item at the end of the edge
    public let node: Starship?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct FilmVehiclesConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [FilmVehiclesEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let vehicles: [Vehicle]?
}

/// An edge in a connection.
public struct FilmVehiclesEdge {
    /// The item at the end of the edge
    public let node: Vehicle?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct FilmCharactersConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [FilmCharactersEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let characters: [Person]?
}

/// An edge in a connection.
public struct FilmCharactersEdge {
    /// The item at the end of the edge
    public let node: Person?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct FilmPlanetsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [FilmPlanetsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let planets: [Planet]?
}

/// An edge in a connection.
public struct FilmPlanetsEdge {
    /// The item at the end of the edge
    public let node: Planet?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct PeopleConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [PeopleEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let people: [Person]?
}

/// An edge in a connection.
public struct PeopleEdge {
    /// The item at the end of the edge
    public let node: Person?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct PlanetsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [PlanetsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let planets: [Planet]?
}

/// An edge in a connection.
public struct PlanetsEdge {
    /// The item at the end of the edge
    public let node: Planet?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct SpeciesConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [SpeciesEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let species: [Species]?
}

/// An edge in a connection.
public struct SpeciesEdge {
    /// The item at the end of the edge
    public let node: Species?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct StarshipsConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [StarshipsEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let starships: [Starship]?
}

/// An edge in a connection.
public struct StarshipsEdge {
    /// The item at the end of the edge
    public let node: Starship?
    /// A cursor for use in pagination
    public let cursor: String
}

/// A connection to a list of items.
public struct VehiclesConnection {
    /// Information to aid in pagination.
    public let pageInfo: PageInfo
    /// A list of edges.
    public let edges: [VehiclesEdge]?
    /// A count of the total number of objects in this connection, ignoring pagination.
    /// This allows a client to fetch the first five objects by passing "5" as the
    /// argument to "first", then fetch the total count so it could display "5 of 83",
    /// for example.
    public let totalCount: Int?
    /// A list of all of the objects returned in the connection. This is a convenience
    /// field provided for quickly exploring the API; rather than querying for
    /// "{ edges { node } }" when no edge data is needed, this field can be be used
    /// instead. Note that when clients like Relay need to fetch the "cursor" field on
    /// the edge to enable efficient pagination, this shortcut cannot be used, and the
    /// full "{ edges { node } }" version should be used instead.
    public let vehicles: [Vehicle]?
}

/// An edge in a connection.
public struct VehiclesEdge {
    /// The item at the end of the edge
    public let node: Vehicle?
    /// A cursor for use in pagination
    public let cursor: String
}


// MARK: - Enums


// MARK: - Protocols

/// An object with an ID
public protocol Node {
    /// The id of the object.
    var id: String { get }
}

