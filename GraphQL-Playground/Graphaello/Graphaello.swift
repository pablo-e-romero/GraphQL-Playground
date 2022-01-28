// swiftlint:disable all
// This file was automatically generated and should not be edited.

import Apollo
import Combine
import Foundation
import SwiftUI

// MARK: Basic API

protocol Target {}

protocol API: Target {
    var client: ApolloClient { get }
}

extension API {
    func fetch<Query: GraphQLQuery>(query: Query, completion: @escaping (Result<Query.Data, GraphQLLoadingError<Self>>) -> Void) {
        client.fetch(query: query) { result in
            switch result {
            case let .success(result):
                guard let data = result.data else {
                    if let errors = result.errors, errors.count > 0 {
                        return completion(.failure(.graphQLErrors(errors)))
                    }
                    return completion(.failure(.emptyData(api: self)))
                }
                completion(.success(data))
            case let .failure(error):
                completion(.failure(.networkError(error)))
            }
        }
    }
}

protocol MutationTarget: Target {}

protocol Connection: Target {
    associatedtype Node
}

protocol Fragment {
    associatedtype UnderlyingType
    static var placeholder: Self { get }
}

extension Array: Fragment where Element: Fragment {
    typealias UnderlyingType = [Element.UnderlyingType]

    static var placeholder: [Element] {
        return Array(repeating: Element.placeholder, count: 5)
    }
}

extension Optional: Fragment where Wrapped: Fragment {
    typealias UnderlyingType = Wrapped.UnderlyingType?

    static var placeholder: Wrapped? {
        return Wrapped.placeholder
    }
}

protocol Mutation: ObservableObject {
    associatedtype Value

    var isLoading: Bool { get }
}

protocol CurrentValueMutation: ObservableObject {
    associatedtype Value

    var isLoading: Bool { get }
    var value: Value { get }
    var error: Error? { get }
}

// MARK: - Basic API: Paths

struct GraphQLPath<TargetType: Target, Value> {
    fileprivate init() {}
}

struct GraphQLFragmentPath<TargetType: Target, UnderlyingType> {
    fileprivate init() {}
}

extension GraphQLFragmentPath {
    typealias Path<V> = GraphQLPath<TargetType, V>
    typealias FragmentPath<V> = GraphQLFragmentPath<TargetType, V>
}

extension GraphQLFragmentPath {
    var _fragment: FragmentPath<UnderlyingType> {
        return self
    }
}

extension GraphQLFragmentPath {
    func _forEach<Value, Output>(_: KeyPath<GraphQLFragmentPath<TargetType, Value>, GraphQLPath<TargetType, Output>>) -> GraphQLPath<TargetType, [Output]> where UnderlyingType == [Value] {
        return .init()
    }

    func _forEach<Value, Output>(_: KeyPath<GraphQLFragmentPath<TargetType, Value>, GraphQLPath<TargetType, Output>>) -> GraphQLPath<TargetType, [Output]?> where UnderlyingType == [Value]? {
        return .init()
    }
}

extension GraphQLFragmentPath {
    func _forEach<Value, Output>(_: KeyPath<GraphQLFragmentPath<TargetType, Value>, GraphQLFragmentPath<TargetType, Output>>) -> GraphQLFragmentPath<TargetType, [Output]> where UnderlyingType == [Value] {
        return .init()
    }

    func _forEach<Value, Output>(_: KeyPath<GraphQLFragmentPath<TargetType, Value>, GraphQLFragmentPath<TargetType, Output>>) -> GraphQLFragmentPath<TargetType, [Output]?> where UnderlyingType == [Value]? {
        return .init()
    }
}

extension GraphQLFragmentPath {
    func _flatten<T>() -> GraphQLFragmentPath<TargetType, [T]> where UnderlyingType == [[T]] {
        return .init()
    }

    func _flatten<T>() -> GraphQLFragmentPath<TargetType, [T]?> where UnderlyingType == [[T]]? {
        return .init()
    }
}

extension GraphQLPath {
    func _flatten<T>() -> GraphQLPath<TargetType, [T]> where Value == [[T]] {
        return .init()
    }

    func _flatten<T>() -> GraphQLPath<TargetType, [T]?> where Value == [[T]]? {
        return .init()
    }
}

extension GraphQLFragmentPath {
    func _compactMap<T>() -> GraphQLFragmentPath<TargetType, [T]> where UnderlyingType == [T?] {
        return .init()
    }

    func _compactMap<T>() -> GraphQLFragmentPath<TargetType, [T]?> where UnderlyingType == [T?]? {
        return .init()
    }
}

extension GraphQLPath {
    func _compactMap<T>() -> GraphQLPath<TargetType, [T]> where Value == [T?] {
        return .init()
    }

    func _compactMap<T>() -> GraphQLPath<TargetType, [T]?> where Value == [T?]? {
        return .init()
    }
}

extension GraphQLFragmentPath {
    func _nonNull<T>() -> GraphQLFragmentPath<TargetType, T> where UnderlyingType == T? {
        return .init()
    }
}

extension GraphQLPath {
    func _nonNull<T>() -> GraphQLPath<TargetType, T> where Value == T? {
        return .init()
    }
}

extension GraphQLFragmentPath {
    func _withDefault<T>(_: @autoclosure () -> T) -> GraphQLFragmentPath<TargetType, T> where UnderlyingType == T? {
        return .init()
    }
}

extension GraphQLPath {
    func _withDefault<T>(_: @autoclosure () -> T) -> GraphQLPath<TargetType, T> where Value == T? {
        return .init()
    }
}

// MARK: - Basic API: Arguments

enum GraphQLArgument<Value> {
    enum QueryArgument {
        case withDefault(Value)
        case forced
    }

    case value(Value)
    case argument(QueryArgument)
}

extension GraphQLArgument {
    static var argument: GraphQLArgument<Value> {
        return .argument(.forced)
    }

    static func argument(default value: Value) -> GraphQLArgument<Value> {
        return .argument(.withDefault(value))
    }
}

// MARK: - Basic API: Paging

class Paging<Value: Fragment>: DynamicProperty, ObservableObject {
    fileprivate struct Response {
        let values: [Value]
        let cursor: String?
        let hasMore: Bool

        static var empty: Response {
            Response(values: [], cursor: nil, hasMore: false)
        }
    }

    fileprivate typealias Completion = (Result<Response, Error>) -> Void
    fileprivate typealias Loader = (String, Int?, @escaping Completion) -> Void

    private let loader: Loader

    @Published
    private(set) var isLoading: Bool = false

    @Published
    private(set) var values: [Value] = []

    private var cursor: String?

    @Published
    private(set) var hasMore: Bool = false

    @Published
    private(set) var error: Error? = nil

    fileprivate init(_ response: Response, loader: @escaping Loader) {
        self.loader = loader
        use(response)
    }

    func loadMore(pageSize: Int? = nil) {
        guard let cursor = cursor, !isLoading else { return }
        isLoading = true
        loader(cursor, pageSize) { [weak self] result in
            switch result {
            case let .success(response):
                self?.use(response)
            case let .failure(error):
                self?.handle(error)
            }
        }
    }

    private func use(_ response: Response) {
        isLoading = false
        values += response.values
        cursor = response.cursor
        hasMore = response.hasMore
    }

    private func handle(_ error: Error) {
        isLoading = false
        hasMore = false
        self.error = error
    }
}

// MARK: - Basic API: Error Types

enum GraphQLLoadingError<T: API>: Error {
    case emptyData(api: T)
    case graphQLErrors([GraphQLError])
    case networkError(Error)
}

// MARK: - Basic API: Refresh

protocol QueryRefreshController {
    func refresh()
    func refresh(completion: @escaping (Error?) -> Void)
}

private struct QueryRefreshControllerEnvironmentKey: EnvironmentKey {
    static let defaultValue: QueryRefreshController? = nil
}

extension EnvironmentValues {
    var queryRefreshController: QueryRefreshController? {
        get {
            self[QueryRefreshControllerEnvironmentKey.self]
        } set {
            self[QueryRefreshControllerEnvironmentKey.self] = newValue
        }
    }
}

// MARK: - Error Handling

enum QueryError {
    case network(Error)
    case graphql([GraphQLError])
}

extension QueryError: CustomStringConvertible {
    var description: String {
        switch self {
        case let .network(error):
            return error.localizedDescription
        case let .graphql(errors):
            return errors.map { $0.description }.joined(separator: ", ")
        }
    }
}

extension QueryError {
    var networkError: Error? {
        guard case let .network(error) = self else { return nil }
        return error
    }

    var graphQLErrors: [GraphQLError]? {
        guard case let .graphql(errors) = self else { return nil }
        return errors
    }
}

protocol QueryErrorController {
    var error: QueryError? { get }
    func clear()
}

private struct QueryErrorControllerEnvironmentKey: EnvironmentKey {
    static let defaultValue: QueryErrorController? = nil
}

extension EnvironmentValues {
    var queryErrorController: QueryErrorController? {
        get {
            self[QueryErrorControllerEnvironmentKey.self]
        } set {
            self[QueryErrorControllerEnvironmentKey.self] = newValue
        }
    }
}

// MARK: - Basic API: Views

private struct QueryRenderer<Query: GraphQLQuery, Loading: View, Error: View, Content: View>: View {
    typealias ContentFactory = (Query.Data) -> Content
    typealias ErrorFactory = (QueryError) -> Error

    private final class ViewModel: ObservableObject {
        @Published var isLoading: Bool = false
        @Published var value: Query.Data? = nil
        @Published var error: QueryError? = nil

        private var previous: Query?
        private var cancellable: Apollo.Cancellable?

        deinit {
            cancel()
        }

        func load(client: ApolloClient, query: Query) {
            guard previous !== query || (value == nil && !isLoading) else { return }
            perform(client: client, query: query)
        }

        func refresh(client: ApolloClient, query: Query, completion: ((Swift.Error?) -> Void)? = nil) {
            perform(client: client, query: query, cachePolicy: .fetchIgnoringCacheData, completion: completion)
        }

        private func perform(client: ApolloClient, query: Query, cachePolicy: CachePolicy = .returnCacheDataElseFetch, completion: ((Swift.Error?) -> Void)? = nil) {
            previous = query
            cancellable = client.fetch(query: query, cachePolicy: cachePolicy) { [weak self] result in
                defer {
                    self?.cancellable = nil
                    self?.isLoading = false
                }
                switch result {
                case let .success(result):
                    self?.value = result.data
                    self?.error = result.errors.map { .graphql($0) }
                    completion?(nil)
                case let .failure(error):
                    self?.error = .network(error)
                    completion?(error)
                }
            }
            isLoading = true
        }

        func cancel() {
            cancellable?.cancel()
        }
    }

    private struct RefreshController: QueryRefreshController {
        let client: ApolloClient
        let query: Query
        let viewModel: ViewModel

        func refresh() {
            viewModel.refresh(client: client, query: query)
        }

        func refresh(completion: @escaping (Swift.Error?) -> Void) {
            viewModel.refresh(client: client, query: query, completion: completion)
        }
    }

    private struct ErrorController: QueryErrorController {
        let viewModel: ViewModel

        var error: QueryError? {
            return viewModel.error
        }

        func clear() {
            viewModel.error = nil
        }
    }

    let client: ApolloClient
    let query: Query
    let loading: Loading
    let error: ErrorFactory
    let factory: ContentFactory

    @ObservedObject private var viewModel = ViewModel()
    @State private var hasAppeared = false

    var body: some View {
        if hasAppeared {
            self.viewModel.load(client: self.client, query: self.query)
        }
        return VStack {
            viewModel.isLoading && viewModel.value == nil && viewModel.error == nil ? loading : nil
            viewModel.value == nil ? viewModel.error.map(error) : nil
            viewModel
                .value
                .map(factory)
                .environment(\.queryRefreshController, RefreshController(client: client, query: query, viewModel: viewModel))
                .environment(\.queryErrorController, ErrorController(viewModel: viewModel))
        }
        .onAppear {
            DispatchQueue.main.async {
                self.hasAppeared = true
            }
            self.viewModel.load(client: self.client, query: self.query)
        }
        .onDisappear {
            DispatchQueue.main.async {
                self.hasAppeared = false
            }
            self.viewModel.cancel()
        }
    }
}

private struct BasicErrorView: View {
    let error: QueryError

    var body: some View {
        Text("Error: \(error.description)")
    }
}

private struct BasicLoadingView: View {
    var body: some View {
        Text("Loading")
    }
}

struct PagingView<Value: Fragment>: View {
    enum Mode {
        case list
        case vertical(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, insets: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        case horizontal(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, insets: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }

    enum Data {
        case item(Value, Int)
        case loading
        case error(Error)

        fileprivate var id: String {
            switch self {
            case let .item(_, int):
                return int.description
            case .error:
                return "error"
            case .loading:
                return "loading"
            }
        }
    }

    @ObservedObject private var paging: Paging<Value>
    private let mode: Mode
    private let pageSize: Int?
    private var loader: (Data) -> AnyView

    @State private var visibleRect: CGRect = .zero

    init(_ paging: Paging<Value>, mode: Mode = .list, pageSize: Int? = nil, loader: @escaping (Data) -> AnyView) {
        self.paging = paging
        self.mode = mode
        self.pageSize = pageSize
        self.loader = loader
    }

    var body: some View {
        let data = self.paging.values.enumerated().map { Data.item($0.element, $0.offset) } +
            [self.paging.isLoading ? Data.loading : nil, self.paging.error.map(Data.error)].compactMap { $0 }

        switch mode {
        case .list:
            return AnyView(
                List(data, id: \.id) { data in
                    self.loader(data).onAppear { self.onAppear(data: data) }
                }
            )
        case let .vertical(alignment, spacing, insets):
            return AnyView(
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(alignment: alignment, spacing: spacing) {
                        ForEach(data, id: \.id) { data in
                            self.loader(data).ifVisible(in: self.visibleRect, in: .named("InfiniteVerticalScroll")) { self.onAppear(data: data) }
                        }
                    }
                    .padding(insets)
                }
                .coordinateSpace(name: "InfiniteVerticalScroll")
                .rectReader($visibleRect, in: .named("InfiniteVerticalScroll"))
            )
        case let .horizontal(alignment, spacing, insets):
            return AnyView(
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: alignment, spacing: spacing) {
                        ForEach(data, id: \.id) { data in
                            self.loader(data).ifVisible(in: self.visibleRect, in: .named("InfiniteHorizontalScroll")) { self.onAppear(data: data) }
                        }
                    }
                    .padding(insets)
                }
                .coordinateSpace(name: "InfiniteHorizontalScroll")
                .rectReader($visibleRect, in: .named("InfiniteHorizontalScroll"))
            )
        }
    }

    private func onAppear(data: Data) {
        guard !paging.isLoading,
            paging.hasMore,
            case let .item(_, index) = data,
            index > paging.values.count - 2 else { return }

        DispatchQueue.main.async {
            paging.loadMore(pageSize: pageSize)
        }
    }
}

extension PagingView {
    init<Loading: View, Error: View, Data: View>(_ paging: Paging<Value>,
                                                 mode: Mode = .list,
                                                 pageSize: Int? = nil,
                                                 loading loadingView: @escaping () -> Loading,
                                                 error errorView: @escaping (Swift.Error) -> Error,
                                                 item itemView: @escaping (Value) -> Data) {
        self.init(paging, mode: mode, pageSize: pageSize) { data in
            switch data {
            case let .item(item, _):
                return AnyView(itemView(item))
            case let .error(error):
                return AnyView(errorView(error))
            case .loading:
                return AnyView(loadingView())
            }
        }
    }

    init<Error: View, Data: View>(_ paging: Paging<Value>,
                                  mode: Mode = .list,
                                  pageSize: Int? = nil,
                                  error errorView: @escaping (Swift.Error) -> Error,
                                  item itemView: @escaping (Value) -> Data) {
        self.init(paging,
                  mode: mode,
                  pageSize: pageSize,
                  loading: { PagingBasicLoadingView(content: itemView) },
                  error: errorView,
                  item: itemView)
    }

    init<Loading: View, Data: View>(_ paging: Paging<Value>,
                                    mode: Mode = .list,
                                    pageSize: Int? = nil,
                                    loading loadingView: @escaping () -> Loading,
                                    item itemView: @escaping (Value) -> Data) {
        self.init(paging,
                  mode: mode,
                  pageSize: pageSize,
                  loading: loadingView,
                  error: { Text("Error: \($0.localizedDescription)") },
                  item: itemView)
    }

    init<Data: View>(_ paging: Paging<Value>,
                     mode: Mode = .list,
                     pageSize: Int? = nil,
                     item itemView: @escaping (Value) -> Data) {
        self.init(paging,
                  mode: mode,
                  pageSize: pageSize,
                  loading: { PagingBasicLoadingView(content: itemView) },
                  error: { Text("Error: \($0.localizedDescription)") },
                  item: itemView)
    }
}

private struct PagingBasicLoadingView<Value: Fragment, Content: View>: View {
    let content: (Value) -> Content

    var body: some View {
        if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
            content(.placeholder).disabled(true).redacted(reason: .placeholder)
        } else {
            BasicLoadingView()
        }
    }
}

extension PagingView.Mode {
    static func vertical(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, padding edges: Edge.Set, by padding: CGFloat) -> PagingView.Mode {
        return .vertical(alignment: alignment,
                         spacing: spacing,
                         insets: EdgeInsets(top: edges.contains(.top) ? padding : 0,
                                            leading: edges.contains(.leading) ? padding : 0,
                                            bottom: edges.contains(.bottom) ? padding : 0,
                                            trailing: edges.contains(.trailing) ? padding : 0))
    }

    static func vertical(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, padding: CGFloat) -> PagingView.Mode {
        return .vertical(alignment: alignment, spacing: spacing, padding: .all, by: padding)
    }

    static var vertical: PagingView.Mode { .vertical() }

    static func horizontal(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, padding edges: Edge.Set, by padding: CGFloat) -> PagingView.Mode {
        return .horizontal(alignment: alignment,
                           spacing: spacing,
                           insets: EdgeInsets(top: edges.contains(.top) ? padding : 0,
                                              leading: edges.contains(.leading) ? padding : 0,
                                              bottom: edges.contains(.bottom) ? padding : 0,
                                              trailing: edges.contains(.trailing) ? padding : 0))
    }

    static func horizontal(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, padding: CGFloat) -> PagingView.Mode {
        return .horizontal(alignment: alignment, spacing: spacing, padding: .all, by: padding)
    }

    static var horizontal: PagingView.Mode { .horizontal() }
}

extension View {
    fileprivate func rectReader(_ binding: Binding<CGRect>, in space: CoordinateSpace) -> some View {
        background(GeometryReader { (geometry) -> AnyView in
            let rect = geometry.frame(in: space)
            DispatchQueue.main.async {
                binding.wrappedValue = rect
            }
            return AnyView(Rectangle().fill(Color.clear))
        })
    }
}

extension View {
    fileprivate func ifVisible(in rect: CGRect, in space: CoordinateSpace, execute: @escaping () -> Void) -> some View {
        background(GeometryReader { (geometry) -> AnyView in
            let frame = geometry.frame(in: space)
            if frame.intersects(rect) {
                execute()
            }
            return AnyView(Rectangle().fill(Color.clear))
        })
    }
}

// MARK: - Basic API: Decoders

protocol GraphQLValueDecoder {
    associatedtype Encoded
    associatedtype Decoded

    static func decode(encoded: Encoded) throws -> Decoded
}

enum NoOpDecoder<T>: GraphQLValueDecoder {
    static func decode(encoded: T) throws -> T {
        return encoded
    }
}

// MARK: - Basic API: Scalar Handling

protocol GraphQLScalar {
    associatedtype Scalar
    static var placeholder: Self { get }
    init(from scalar: Scalar) throws
}

extension Array: GraphQLScalar where Element: GraphQLScalar {
    static var placeholder: [Element] {
        return Array(repeating: Element.placeholder, count: 5)
    }

    init(from scalar: [Element.Scalar]) throws {
        self = try scalar.map { try Element(from: $0) }
    }
}

extension Optional: GraphQLScalar where Wrapped: GraphQLScalar {
    static var placeholder: Wrapped? {
        return Wrapped.placeholder
    }

    init(from scalar: Wrapped.Scalar?) throws {
        guard let scalar = scalar else {
            self = .none
            return
        }
        self = .some(try Wrapped(from: scalar))
    }
}

extension URL: GraphQLScalar {
    typealias Scalar = String

    static let placeholder: URL = URL(string: "https://graphaello.dev/assets/logo.png")!

    private struct URLScalarDecodingError: Error {
        let string: String
    }

    init(from string: Scalar) throws {
        guard let url = URL(string: string) else {
            throw URLScalarDecodingError(string: string)
        }
        self = url
    }
}

enum ScalarDecoder<ScalarType: GraphQLScalar>: GraphQLValueDecoder {
    typealias Encoded = ScalarType.Scalar
    typealias Decoded = ScalarType

    static func decode(encoded: ScalarType.Scalar) throws -> ScalarType {
        if let encoded = encoded as? String, encoded == "__GRAPHAELLO_PLACEHOLDER__" {
            return Decoded.placeholder
        }
        return try ScalarType(from: encoded)
    }
}

// MARK: - Basic API: HACK - AnyObservableObject

private class AnyObservableObject: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var cancellable: AnyCancellable?

    func use<O: ObservableObject>(_ object: O) {
        cancellable?.cancel()
        cancellable = object.objectWillChange.sink { [unowned self] _ in self.objectWillChange.send() }
    }
}

// MARK: - Basic API: Graph QL Property Wrapper

@propertyWrapper
struct GraphQL<Decoder: GraphQLValueDecoder>: DynamicProperty {
    private let initialValue: Decoder.Decoded

    @State
    private var value: Decoder.Decoded? = nil

    @ObservedObject
    private var observed: AnyObservableObject = AnyObservableObject()
    private let updateObserved: ((Decoder.Decoded) -> Void)?

    var wrappedValue: Decoder.Decoded {
        get {
            return value ?? initialValue
        }
        nonmutating set {
            value = newValue
            updateObserved?(newValue)
        }
    }

    var projectedValue: Binding<Decoder.Decoded> {
        return Binding(get: { self.wrappedValue }, set: { newValue in self.wrappedValue = newValue })
    }

    init<T: Target>(_: @autoclosure () -> GraphQLPath<T, Decoder.Encoded>) {
        fatalError("Initializer with path only should never be used")
    }

    init<T: Target, Value>(_: @autoclosure () -> GraphQLPath<T, Value>) where Decoder == NoOpDecoder<Value> {
        fatalError("Initializer with path only should never be used")
    }

    init<T: Target, Value: GraphQLScalar>(_: @autoclosure () -> GraphQLPath<T, Value.Scalar>) where Decoder == ScalarDecoder<Value> {
        fatalError("Initializer with path only should never be used")
    }

    fileprivate init(_ wrappedValue: Decoder.Encoded) {
        initialValue = try! Decoder.decode(encoded: wrappedValue)
        updateObserved = nil
    }

    mutating func update() {
        _value.update()
        _observed.update()
    }
}

extension GraphQL where Decoder.Decoded: ObservableObject {
    fileprivate init(_ wrappedValue: Decoder.Encoded) {
        let value = try! Decoder.decode(encoded: wrappedValue)
        initialValue = value

        let observed = AnyObservableObject()
        observed.use(value)

        self.observed = observed
        updateObserved = { observed.use($0) }
    }
}

extension GraphQL {
    init<T: Target, Value: Fragment>(_: @autoclosure () -> GraphQLFragmentPath<T, Value.UnderlyingType>) where Decoder == NoOpDecoder<Value> {
        fatalError("Initializer with path only should never be used")
    }
}

extension GraphQL {
    init<T: API, C: Connection, F: Fragment>(_: @autoclosure () -> GraphQLFragmentPath<T, C>) where Decoder == NoOpDecoder<Paging<F>>, C.Node == F.UnderlyingType {
        fatalError("Initializer with path only should never be used")
    }

    init<T: API, C: Connection, F: Fragment>(_: @autoclosure () -> GraphQLFragmentPath<T, C?>) where Decoder == NoOpDecoder<Paging<F>?>, C.Node == F.UnderlyingType {
        fatalError("Initializer with path only should never be used")
    }
}

extension GraphQL {
    init<T: MutationTarget, MutationType: Mutation>(_: @autoclosure () -> GraphQLPath<T, MutationType.Value>) where Decoder == NoOpDecoder<MutationType> {
        fatalError("Initializer with path only should never be used")
    }

    init<T: MutationTarget, MutationType: Mutation>(_: @autoclosure () -> GraphQLFragmentPath<T, MutationType.Value.UnderlyingType>) where Decoder == NoOpDecoder<MutationType>, MutationType.Value: Fragment {
        fatalError("Initializer with path only should never be used")
    }
}

extension GraphQL {
    init<T: Target, M: MutationTarget, MutationType: CurrentValueMutation>(_: @autoclosure () -> GraphQLPath<T, MutationType.Value>, mutation _: @autoclosure () -> GraphQLPath<M, MutationType.Value>) where Decoder == NoOpDecoder<MutationType> {
        fatalError("Initializer with path only should never be used")
    }

    init<T: Target, M: MutationTarget, MutationType: CurrentValueMutation>(_: @autoclosure () -> GraphQLFragmentPath<T, MutationType.Value.UnderlyingType>, mutation _: @autoclosure () -> GraphQLFragmentPath<M, MutationType.Value.UnderlyingType>) where Decoder == NoOpDecoder<MutationType>, MutationType.Value: Fragment {
        fatalError("Initializer with path only should never be used")
    }
}


// MARK: - SW

#if GRAPHAELLO_GRAPH_QL_PLAYGROUND_TARGET

    struct SW: API {
        let client: ApolloClient

        typealias Query = SW
        typealias Path<V> = GraphQLPath<SW, V>
        typealias FragmentPath<V> = GraphQLFragmentPath<SW, V>

        static func allFilms(after _: GraphQLArgument<String?> = .argument,
                             first _: GraphQLArgument<Int?> = .argument,
                             before _: GraphQLArgument<String?> = .argument,
                             last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmsConnection?> {
            return .init()
        }

        static var allFilms: FragmentPath<SW.FilmsConnection?> { .init() }

        static func film(id _: GraphQLArgument<String?> = .argument,
                         filmID _: GraphQLArgument<String?> = .argument) -> FragmentPath<SW.Film?> {
            return .init()
        }

        static var film: FragmentPath<SW.Film?> { .init() }

        static func allPeople(after _: GraphQLArgument<String?> = .argument,
                              first _: GraphQLArgument<Int?> = .argument,
                              before _: GraphQLArgument<String?> = .argument,
                              last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PeopleConnection?> {
            return .init()
        }

        static var allPeople: FragmentPath<SW.PeopleConnection?> { .init() }

        static func person(id _: GraphQLArgument<String?> = .argument,
                           personID _: GraphQLArgument<String?> = .argument) -> FragmentPath<SW.Person?> {
            return .init()
        }

        static var person: FragmentPath<SW.Person?> { .init() }

        static func allPlanets(after _: GraphQLArgument<String?> = .argument,
                               first _: GraphQLArgument<Int?> = .argument,
                               before _: GraphQLArgument<String?> = .argument,
                               last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PlanetsConnection?> {
            return .init()
        }

        static var allPlanets: FragmentPath<SW.PlanetsConnection?> { .init() }

        static func planet(id _: GraphQLArgument<String?> = .argument,
                           planetID _: GraphQLArgument<String?> = .argument) -> FragmentPath<SW.Planet?> {
            return .init()
        }

        static var planet: FragmentPath<SW.Planet?> { .init() }

        static func allSpecies(after _: GraphQLArgument<String?> = .argument,
                               first _: GraphQLArgument<Int?> = .argument,
                               before _: GraphQLArgument<String?> = .argument,
                               last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.SpeciesConnection?> {
            return .init()
        }

        static var allSpecies: FragmentPath<SW.SpeciesConnection?> { .init() }

        static func species(id _: GraphQLArgument<String?> = .argument,
                            speciesID _: GraphQLArgument<String?> = .argument) -> FragmentPath<SW.Species?> {
            return .init()
        }

        static var species: FragmentPath<SW.Species?> { .init() }

        static func allStarships(after _: GraphQLArgument<String?> = .argument,
                                 first _: GraphQLArgument<Int?> = .argument,
                                 before _: GraphQLArgument<String?> = .argument,
                                 last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.StarshipsConnection?> {
            return .init()
        }

        static var allStarships: FragmentPath<SW.StarshipsConnection?> { .init() }

        static func starship(id _: GraphQLArgument<String?> = .argument,
                             starshipID _: GraphQLArgument<String?> = .argument) -> FragmentPath<SW.Starship?> {
            return .init()
        }

        static var starship: FragmentPath<SW.Starship?> { .init() }

        static func allVehicles(after _: GraphQLArgument<String?> = .argument,
                                first _: GraphQLArgument<Int?> = .argument,
                                before _: GraphQLArgument<String?> = .argument,
                                last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.VehiclesConnection?> {
            return .init()
        }

        static var allVehicles: FragmentPath<SW.VehiclesConnection?> { .init() }

        static func vehicle(id _: GraphQLArgument<String?> = .argument,
                            vehicleID _: GraphQLArgument<String?> = .argument) -> FragmentPath<SW.Vehicle?> {
            return .init()
        }

        static var vehicle: FragmentPath<SW.Vehicle?> { .init() }

        static func node(id _: GraphQLArgument<String> = .argument) -> FragmentPath<SW.Node?> {
            return .init()
        }

        static var node: FragmentPath<SW.Node?> { .init() }

        enum FilmsConnection: Target, Connection {
            typealias Node = SW.Film
            typealias Path<V> = GraphQLPath<FilmsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.FilmsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var films: FragmentPath<[SW.Film?]?> { .init() }

            static var _fragment: FragmentPath<FilmsConnection> { .init() }
        }

        enum PageInfo: Target {
            typealias Path<V> = GraphQLPath<PageInfo, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PageInfo, V>

            static var hasNextPage: Path<Bool> { .init() }

            static var hasPreviousPage: Path<Bool> { .init() }

            static var startCursor: Path<String?> { .init() }

            static var endCursor: Path<String?> { .init() }

            static var _fragment: FragmentPath<PageInfo> { .init() }
        }

        enum FilmsEdge: Target {
            typealias Path<V> = GraphQLPath<FilmsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmsEdge, V>

            static var node: FragmentPath<SW.Film?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<FilmsEdge> { .init() }
        }

        enum Film: Target {
            typealias Path<V> = GraphQLPath<Film, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<Film, V>

            static var title: Path<String?> { .init() }

            static var episodeId: Path<Int?> { .init() }

            static var openingCrawl: Path<String?> { .init() }

            static var director: Path<String?> { .init() }

            static var producers: Path<[String?]?> { .init() }

            static var releaseDate: Path<String?> { .init() }

            static func speciesConnection(after _: GraphQLArgument<String?> = .argument,
                                          first _: GraphQLArgument<Int?> = .argument,
                                          before _: GraphQLArgument<String?> = .argument,
                                          last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmSpeciesConnection?> {
                return .init()
            }

            static var speciesConnection: FragmentPath<SW.FilmSpeciesConnection?> { .init() }

            static func starshipConnection(after _: GraphQLArgument<String?> = .argument,
                                           first _: GraphQLArgument<Int?> = .argument,
                                           before _: GraphQLArgument<String?> = .argument,
                                           last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmStarshipsConnection?> {
                return .init()
            }

            static var starshipConnection: FragmentPath<SW.FilmStarshipsConnection?> { .init() }

            static func vehicleConnection(after _: GraphQLArgument<String?> = .argument,
                                          first _: GraphQLArgument<Int?> = .argument,
                                          before _: GraphQLArgument<String?> = .argument,
                                          last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmVehiclesConnection?> {
                return .init()
            }

            static var vehicleConnection: FragmentPath<SW.FilmVehiclesConnection?> { .init() }

            static func characterConnection(after _: GraphQLArgument<String?> = .argument,
                                            first _: GraphQLArgument<Int?> = .argument,
                                            before _: GraphQLArgument<String?> = .argument,
                                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmCharactersConnection?> {
                return .init()
            }

            static var characterConnection: FragmentPath<SW.FilmCharactersConnection?> { .init() }

            static func planetConnection(after _: GraphQLArgument<String?> = .argument,
                                         first _: GraphQLArgument<Int?> = .argument,
                                         before _: GraphQLArgument<String?> = .argument,
                                         last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmPlanetsConnection?> {
                return .init()
            }

            static var planetConnection: FragmentPath<SW.FilmPlanetsConnection?> { .init() }

            static var created: Path<String?> { .init() }

            static var edited: Path<String?> { .init() }

            static var id: Path<String> { .init() }

            static var node: FragmentPath<Node> { .init() }

            static var _fragment: FragmentPath<Film> { .init() }
        }

        enum Node: Target {
            typealias Path<V> = GraphQLPath<Node, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<Node, V>

            static var id: Path<String> { .init() }

            static var film: FragmentPath<Film?> { .init() }

            static var species: FragmentPath<Species?> { .init() }

            static var planet: FragmentPath<Planet?> { .init() }

            static var person: FragmentPath<Person?> { .init() }

            static var starship: FragmentPath<Starship?> { .init() }

            static var vehicle: FragmentPath<Vehicle?> { .init() }

            static var _fragment: FragmentPath<Node> { .init() }
        }

        enum FilmSpeciesConnection: Target, Connection {
            typealias Node = SW.Species
            typealias Path<V> = GraphQLPath<FilmSpeciesConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmSpeciesConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.FilmSpeciesEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var species: FragmentPath<[SW.Species?]?> { .init() }

            static var _fragment: FragmentPath<FilmSpeciesConnection> { .init() }
        }

        enum FilmSpeciesEdge: Target {
            typealias Path<V> = GraphQLPath<FilmSpeciesEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmSpeciesEdge, V>

            static var node: FragmentPath<SW.Species?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<FilmSpeciesEdge> { .init() }
        }

        enum Species: Target {
            typealias Path<V> = GraphQLPath<Species, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<Species, V>

            static var name: Path<String?> { .init() }

            static var classification: Path<String?> { .init() }

            static var designation: Path<String?> { .init() }

            static var averageHeight: Path<Double?> { .init() }

            static var averageLifespan: Path<Int?> { .init() }

            static var eyeColors: Path<[String?]?> { .init() }

            static var hairColors: Path<[String?]?> { .init() }

            static var skinColors: Path<[String?]?> { .init() }

            static var language: Path<String?> { .init() }

            static var homeworld: FragmentPath<SW.Planet?> { .init() }

            static func personConnection(after _: GraphQLArgument<String?> = .argument,
                                         first _: GraphQLArgument<Int?> = .argument,
                                         before _: GraphQLArgument<String?> = .argument,
                                         last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.SpeciesPeopleConnection?> {
                return .init()
            }

            static var personConnection: FragmentPath<SW.SpeciesPeopleConnection?> { .init() }

            static func filmConnection(after _: GraphQLArgument<String?> = .argument,
                                       first _: GraphQLArgument<Int?> = .argument,
                                       before _: GraphQLArgument<String?> = .argument,
                                       last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.SpeciesFilmsConnection?> {
                return .init()
            }

            static var filmConnection: FragmentPath<SW.SpeciesFilmsConnection?> { .init() }

            static var created: Path<String?> { .init() }

            static var edited: Path<String?> { .init() }

            static var id: Path<String> { .init() }

            static var node: FragmentPath<Node> { .init() }

            static var _fragment: FragmentPath<Species> { .init() }
        }

        enum Planet: Target {
            typealias Path<V> = GraphQLPath<Planet, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<Planet, V>

            static var name: Path<String?> { .init() }

            static var diameter: Path<Int?> { .init() }

            static var rotationPeriod: Path<Int?> { .init() }

            static var orbitalPeriod: Path<Int?> { .init() }

            static var gravity: Path<String?> { .init() }

            static var population: Path<Double?> { .init() }

            static var climates: Path<[String?]?> { .init() }

            static var terrains: Path<[String?]?> { .init() }

            static var surfaceWater: Path<Double?> { .init() }

            static func residentConnection(after _: GraphQLArgument<String?> = .argument,
                                           first _: GraphQLArgument<Int?> = .argument,
                                           before _: GraphQLArgument<String?> = .argument,
                                           last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PlanetResidentsConnection?> {
                return .init()
            }

            static var residentConnection: FragmentPath<SW.PlanetResidentsConnection?> { .init() }

            static func filmConnection(after _: GraphQLArgument<String?> = .argument,
                                       first _: GraphQLArgument<Int?> = .argument,
                                       before _: GraphQLArgument<String?> = .argument,
                                       last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PlanetFilmsConnection?> {
                return .init()
            }

            static var filmConnection: FragmentPath<SW.PlanetFilmsConnection?> { .init() }

            static var created: Path<String?> { .init() }

            static var edited: Path<String?> { .init() }

            static var id: Path<String> { .init() }

            static var node: FragmentPath<Node> { .init() }

            static var _fragment: FragmentPath<Planet> { .init() }
        }

        enum PlanetResidentsConnection: Target, Connection {
            typealias Node = SW.Person
            typealias Path<V> = GraphQLPath<PlanetResidentsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PlanetResidentsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.PlanetResidentsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var residents: FragmentPath<[SW.Person?]?> { .init() }

            static var _fragment: FragmentPath<PlanetResidentsConnection> { .init() }
        }

        enum PlanetResidentsEdge: Target {
            typealias Path<V> = GraphQLPath<PlanetResidentsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PlanetResidentsEdge, V>

            static var node: FragmentPath<SW.Person?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<PlanetResidentsEdge> { .init() }
        }

        enum Person: Target {
            typealias Path<V> = GraphQLPath<Person, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<Person, V>

            static var name: Path<String?> { .init() }

            static var birthYear: Path<String?> { .init() }

            static var eyeColor: Path<String?> { .init() }

            static var gender: Path<String?> { .init() }

            static var hairColor: Path<String?> { .init() }

            static var height: Path<Int?> { .init() }

            static var mass: Path<Double?> { .init() }

            static var skinColor: Path<String?> { .init() }

            static var homeworld: FragmentPath<SW.Planet?> { .init() }

            static func filmConnection(after _: GraphQLArgument<String?> = .argument,
                                       first _: GraphQLArgument<Int?> = .argument,
                                       before _: GraphQLArgument<String?> = .argument,
                                       last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PersonFilmsConnection?> {
                return .init()
            }

            static var filmConnection: FragmentPath<SW.PersonFilmsConnection?> { .init() }

            static var species: FragmentPath<SW.Species?> { .init() }

            static func starshipConnection(after _: GraphQLArgument<String?> = .argument,
                                           first _: GraphQLArgument<Int?> = .argument,
                                           before _: GraphQLArgument<String?> = .argument,
                                           last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PersonStarshipsConnection?> {
                return .init()
            }

            static var starshipConnection: FragmentPath<SW.PersonStarshipsConnection?> { .init() }

            static func vehicleConnection(after _: GraphQLArgument<String?> = .argument,
                                          first _: GraphQLArgument<Int?> = .argument,
                                          before _: GraphQLArgument<String?> = .argument,
                                          last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PersonVehiclesConnection?> {
                return .init()
            }

            static var vehicleConnection: FragmentPath<SW.PersonVehiclesConnection?> { .init() }

            static var created: Path<String?> { .init() }

            static var edited: Path<String?> { .init() }

            static var id: Path<String> { .init() }

            static var node: FragmentPath<Node> { .init() }

            static var _fragment: FragmentPath<Person> { .init() }
        }

        enum PersonFilmsConnection: Target, Connection {
            typealias Node = SW.Film
            typealias Path<V> = GraphQLPath<PersonFilmsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PersonFilmsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.PersonFilmsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var films: FragmentPath<[SW.Film?]?> { .init() }

            static var _fragment: FragmentPath<PersonFilmsConnection> { .init() }
        }

        enum PersonFilmsEdge: Target {
            typealias Path<V> = GraphQLPath<PersonFilmsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PersonFilmsEdge, V>

            static var node: FragmentPath<SW.Film?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<PersonFilmsEdge> { .init() }
        }

        enum PersonStarshipsConnection: Target, Connection {
            typealias Node = SW.Starship
            typealias Path<V> = GraphQLPath<PersonStarshipsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PersonStarshipsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.PersonStarshipsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var starships: FragmentPath<[SW.Starship?]?> { .init() }

            static var _fragment: FragmentPath<PersonStarshipsConnection> { .init() }
        }

        enum PersonStarshipsEdge: Target {
            typealias Path<V> = GraphQLPath<PersonStarshipsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PersonStarshipsEdge, V>

            static var node: FragmentPath<SW.Starship?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<PersonStarshipsEdge> { .init() }
        }

        enum Starship: Target {
            typealias Path<V> = GraphQLPath<Starship, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<Starship, V>

            static var name: Path<String?> { .init() }

            static var model: Path<String?> { .init() }

            static var starshipClass: Path<String?> { .init() }

            static var manufacturers: Path<[String?]?> { .init() }

            static var costInCredits: Path<Double?> { .init() }

            static var length: Path<Double?> { .init() }

            static var crew: Path<String?> { .init() }

            static var passengers: Path<String?> { .init() }

            static var maxAtmospheringSpeed: Path<Int?> { .init() }

            static var hyperdriveRating: Path<Double?> { .init() }

            static var mglt: Path<Int?> { .init() }

            static var cargoCapacity: Path<Double?> { .init() }

            static var consumables: Path<String?> { .init() }

            static func pilotConnection(after _: GraphQLArgument<String?> = .argument,
                                        first _: GraphQLArgument<Int?> = .argument,
                                        before _: GraphQLArgument<String?> = .argument,
                                        last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.StarshipPilotsConnection?> {
                return .init()
            }

            static var pilotConnection: FragmentPath<SW.StarshipPilotsConnection?> { .init() }

            static func filmConnection(after _: GraphQLArgument<String?> = .argument,
                                       first _: GraphQLArgument<Int?> = .argument,
                                       before _: GraphQLArgument<String?> = .argument,
                                       last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.StarshipFilmsConnection?> {
                return .init()
            }

            static var filmConnection: FragmentPath<SW.StarshipFilmsConnection?> { .init() }

            static var created: Path<String?> { .init() }

            static var edited: Path<String?> { .init() }

            static var id: Path<String> { .init() }

            static var node: FragmentPath<Node> { .init() }

            static var _fragment: FragmentPath<Starship> { .init() }
        }

        enum StarshipPilotsConnection: Target, Connection {
            typealias Node = SW.Person
            typealias Path<V> = GraphQLPath<StarshipPilotsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<StarshipPilotsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.StarshipPilotsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var pilots: FragmentPath<[SW.Person?]?> { .init() }

            static var _fragment: FragmentPath<StarshipPilotsConnection> { .init() }
        }

        enum StarshipPilotsEdge: Target {
            typealias Path<V> = GraphQLPath<StarshipPilotsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<StarshipPilotsEdge, V>

            static var node: FragmentPath<SW.Person?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<StarshipPilotsEdge> { .init() }
        }

        enum StarshipFilmsConnection: Target, Connection {
            typealias Node = SW.Film
            typealias Path<V> = GraphQLPath<StarshipFilmsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<StarshipFilmsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.StarshipFilmsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var films: FragmentPath<[SW.Film?]?> { .init() }

            static var _fragment: FragmentPath<StarshipFilmsConnection> { .init() }
        }

        enum StarshipFilmsEdge: Target {
            typealias Path<V> = GraphQLPath<StarshipFilmsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<StarshipFilmsEdge, V>

            static var node: FragmentPath<SW.Film?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<StarshipFilmsEdge> { .init() }
        }

        enum PersonVehiclesConnection: Target, Connection {
            typealias Node = SW.Vehicle
            typealias Path<V> = GraphQLPath<PersonVehiclesConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PersonVehiclesConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.PersonVehiclesEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var vehicles: FragmentPath<[SW.Vehicle?]?> { .init() }

            static var _fragment: FragmentPath<PersonVehiclesConnection> { .init() }
        }

        enum PersonVehiclesEdge: Target {
            typealias Path<V> = GraphQLPath<PersonVehiclesEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PersonVehiclesEdge, V>

            static var node: FragmentPath<SW.Vehicle?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<PersonVehiclesEdge> { .init() }
        }

        enum Vehicle: Target {
            typealias Path<V> = GraphQLPath<Vehicle, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<Vehicle, V>

            static var name: Path<String?> { .init() }

            static var model: Path<String?> { .init() }

            static var vehicleClass: Path<String?> { .init() }

            static var manufacturers: Path<[String?]?> { .init() }

            static var costInCredits: Path<Double?> { .init() }

            static var length: Path<Double?> { .init() }

            static var crew: Path<String?> { .init() }

            static var passengers: Path<String?> { .init() }

            static var maxAtmospheringSpeed: Path<Int?> { .init() }

            static var cargoCapacity: Path<Double?> { .init() }

            static var consumables: Path<String?> { .init() }

            static func pilotConnection(after _: GraphQLArgument<String?> = .argument,
                                        first _: GraphQLArgument<Int?> = .argument,
                                        before _: GraphQLArgument<String?> = .argument,
                                        last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.VehiclePilotsConnection?> {
                return .init()
            }

            static var pilotConnection: FragmentPath<SW.VehiclePilotsConnection?> { .init() }

            static func filmConnection(after _: GraphQLArgument<String?> = .argument,
                                       first _: GraphQLArgument<Int?> = .argument,
                                       before _: GraphQLArgument<String?> = .argument,
                                       last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.VehicleFilmsConnection?> {
                return .init()
            }

            static var filmConnection: FragmentPath<SW.VehicleFilmsConnection?> { .init() }

            static var created: Path<String?> { .init() }

            static var edited: Path<String?> { .init() }

            static var id: Path<String> { .init() }

            static var node: FragmentPath<Node> { .init() }

            static var _fragment: FragmentPath<Vehicle> { .init() }
        }

        enum VehiclePilotsConnection: Target, Connection {
            typealias Node = SW.Person
            typealias Path<V> = GraphQLPath<VehiclePilotsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<VehiclePilotsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.VehiclePilotsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var pilots: FragmentPath<[SW.Person?]?> { .init() }

            static var _fragment: FragmentPath<VehiclePilotsConnection> { .init() }
        }

        enum VehiclePilotsEdge: Target {
            typealias Path<V> = GraphQLPath<VehiclePilotsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<VehiclePilotsEdge, V>

            static var node: FragmentPath<SW.Person?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<VehiclePilotsEdge> { .init() }
        }

        enum VehicleFilmsConnection: Target, Connection {
            typealias Node = SW.Film
            typealias Path<V> = GraphQLPath<VehicleFilmsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<VehicleFilmsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.VehicleFilmsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var films: FragmentPath<[SW.Film?]?> { .init() }

            static var _fragment: FragmentPath<VehicleFilmsConnection> { .init() }
        }

        enum VehicleFilmsEdge: Target {
            typealias Path<V> = GraphQLPath<VehicleFilmsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<VehicleFilmsEdge, V>

            static var node: FragmentPath<SW.Film?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<VehicleFilmsEdge> { .init() }
        }

        enum PlanetFilmsConnection: Target, Connection {
            typealias Node = SW.Film
            typealias Path<V> = GraphQLPath<PlanetFilmsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PlanetFilmsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.PlanetFilmsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var films: FragmentPath<[SW.Film?]?> { .init() }

            static var _fragment: FragmentPath<PlanetFilmsConnection> { .init() }
        }

        enum PlanetFilmsEdge: Target {
            typealias Path<V> = GraphQLPath<PlanetFilmsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PlanetFilmsEdge, V>

            static var node: FragmentPath<SW.Film?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<PlanetFilmsEdge> { .init() }
        }

        enum SpeciesPeopleConnection: Target, Connection {
            typealias Node = SW.Person
            typealias Path<V> = GraphQLPath<SpeciesPeopleConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<SpeciesPeopleConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.SpeciesPeopleEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var people: FragmentPath<[SW.Person?]?> { .init() }

            static var _fragment: FragmentPath<SpeciesPeopleConnection> { .init() }
        }

        enum SpeciesPeopleEdge: Target {
            typealias Path<V> = GraphQLPath<SpeciesPeopleEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<SpeciesPeopleEdge, V>

            static var node: FragmentPath<SW.Person?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<SpeciesPeopleEdge> { .init() }
        }

        enum SpeciesFilmsConnection: Target, Connection {
            typealias Node = SW.Film
            typealias Path<V> = GraphQLPath<SpeciesFilmsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<SpeciesFilmsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.SpeciesFilmsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var films: FragmentPath<[SW.Film?]?> { .init() }

            static var _fragment: FragmentPath<SpeciesFilmsConnection> { .init() }
        }

        enum SpeciesFilmsEdge: Target {
            typealias Path<V> = GraphQLPath<SpeciesFilmsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<SpeciesFilmsEdge, V>

            static var node: FragmentPath<SW.Film?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<SpeciesFilmsEdge> { .init() }
        }

        enum FilmStarshipsConnection: Target, Connection {
            typealias Node = SW.Starship
            typealias Path<V> = GraphQLPath<FilmStarshipsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmStarshipsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.FilmStarshipsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var starships: FragmentPath<[SW.Starship?]?> { .init() }

            static var _fragment: FragmentPath<FilmStarshipsConnection> { .init() }
        }

        enum FilmStarshipsEdge: Target {
            typealias Path<V> = GraphQLPath<FilmStarshipsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmStarshipsEdge, V>

            static var node: FragmentPath<SW.Starship?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<FilmStarshipsEdge> { .init() }
        }

        enum FilmVehiclesConnection: Target, Connection {
            typealias Node = SW.Vehicle
            typealias Path<V> = GraphQLPath<FilmVehiclesConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmVehiclesConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.FilmVehiclesEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var vehicles: FragmentPath<[SW.Vehicle?]?> { .init() }

            static var _fragment: FragmentPath<FilmVehiclesConnection> { .init() }
        }

        enum FilmVehiclesEdge: Target {
            typealias Path<V> = GraphQLPath<FilmVehiclesEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmVehiclesEdge, V>

            static var node: FragmentPath<SW.Vehicle?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<FilmVehiclesEdge> { .init() }
        }

        enum FilmCharactersConnection: Target, Connection {
            typealias Node = SW.Person
            typealias Path<V> = GraphQLPath<FilmCharactersConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmCharactersConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.FilmCharactersEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var characters: FragmentPath<[SW.Person?]?> { .init() }

            static var _fragment: FragmentPath<FilmCharactersConnection> { .init() }
        }

        enum FilmCharactersEdge: Target {
            typealias Path<V> = GraphQLPath<FilmCharactersEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmCharactersEdge, V>

            static var node: FragmentPath<SW.Person?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<FilmCharactersEdge> { .init() }
        }

        enum FilmPlanetsConnection: Target, Connection {
            typealias Node = SW.Planet
            typealias Path<V> = GraphQLPath<FilmPlanetsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmPlanetsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.FilmPlanetsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var planets: FragmentPath<[SW.Planet?]?> { .init() }

            static var _fragment: FragmentPath<FilmPlanetsConnection> { .init() }
        }

        enum FilmPlanetsEdge: Target {
            typealias Path<V> = GraphQLPath<FilmPlanetsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<FilmPlanetsEdge, V>

            static var node: FragmentPath<SW.Planet?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<FilmPlanetsEdge> { .init() }
        }

        enum PeopleConnection: Target, Connection {
            typealias Node = SW.Person
            typealias Path<V> = GraphQLPath<PeopleConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PeopleConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.PeopleEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var people: FragmentPath<[SW.Person?]?> { .init() }

            static var _fragment: FragmentPath<PeopleConnection> { .init() }
        }

        enum PeopleEdge: Target {
            typealias Path<V> = GraphQLPath<PeopleEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PeopleEdge, V>

            static var node: FragmentPath<SW.Person?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<PeopleEdge> { .init() }
        }

        enum PlanetsConnection: Target, Connection {
            typealias Node = SW.Planet
            typealias Path<V> = GraphQLPath<PlanetsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PlanetsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.PlanetsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var planets: FragmentPath<[SW.Planet?]?> { .init() }

            static var _fragment: FragmentPath<PlanetsConnection> { .init() }
        }

        enum PlanetsEdge: Target {
            typealias Path<V> = GraphQLPath<PlanetsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<PlanetsEdge, V>

            static var node: FragmentPath<SW.Planet?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<PlanetsEdge> { .init() }
        }

        enum SpeciesConnection: Target, Connection {
            typealias Node = SW.Species
            typealias Path<V> = GraphQLPath<SpeciesConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<SpeciesConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.SpeciesEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var species: FragmentPath<[SW.Species?]?> { .init() }

            static var _fragment: FragmentPath<SpeciesConnection> { .init() }
        }

        enum SpeciesEdge: Target {
            typealias Path<V> = GraphQLPath<SpeciesEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<SpeciesEdge, V>

            static var node: FragmentPath<SW.Species?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<SpeciesEdge> { .init() }
        }

        enum StarshipsConnection: Target, Connection {
            typealias Node = SW.Starship
            typealias Path<V> = GraphQLPath<StarshipsConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<StarshipsConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.StarshipsEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var starships: FragmentPath<[SW.Starship?]?> { .init() }

            static var _fragment: FragmentPath<StarshipsConnection> { .init() }
        }

        enum StarshipsEdge: Target {
            typealias Path<V> = GraphQLPath<StarshipsEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<StarshipsEdge, V>

            static var node: FragmentPath<SW.Starship?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<StarshipsEdge> { .init() }
        }

        enum VehiclesConnection: Target, Connection {
            typealias Node = SW.Vehicle
            typealias Path<V> = GraphQLPath<VehiclesConnection, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<VehiclesConnection, V>

            static var pageInfo: FragmentPath<SW.PageInfo> { .init() }

            static var edges: FragmentPath<[SW.VehiclesEdge?]?> { .init() }

            static var totalCount: Path<Int?> { .init() }

            static var vehicles: FragmentPath<[SW.Vehicle?]?> { .init() }

            static var _fragment: FragmentPath<VehiclesConnection> { .init() }
        }

        enum VehiclesEdge: Target {
            typealias Path<V> = GraphQLPath<VehiclesEdge, V>
            typealias FragmentPath<V> = GraphQLFragmentPath<VehiclesEdge, V>

            static var node: FragmentPath<SW.Vehicle?> { .init() }

            static var cursor: Path<String> { .init() }

            static var _fragment: FragmentPath<VehiclesEdge> { .init() }
        }
    }

    extension SW {
        init(url: URL = URL(string: "http://localhost:63482")!,
             client: URLSessionClient = URLSessionClient(),
             useGETForQueries: Bool = false,
             enableAutoPersistedQueries: Bool = false,
             useGETForPersistedQueryRetry: Bool = false,
             requestBodyCreator: RequestBodyCreator = ApolloRequestBodyCreator(),
             store: ApolloStore = ApolloStore(cache: InMemoryNormalizedCache())) {
            let provider = LegacyInterceptorProvider(client: client, store: store)
            let networkTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                endpointURL: url,
                                                                autoPersistQueries: enableAutoPersistedQueries,
                                                                requestBodyCreator: requestBodyCreator,
                                                                useGETForQueries: useGETForQueries,
                                                                useGETForPersistedQueryRetry: useGETForPersistedQueryRetry)
            self.init(client: ApolloClient(networkTransport: networkTransport, store: store))
        }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.FilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.FilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PageInfo {
        var hasNextPage: Path<Bool> { .init() }

        var hasPreviousPage: Path<Bool> { .init() }

        var startCursor: Path<String?> { .init() }

        var endCursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PageInfo? {
        var hasNextPage: Path<Bool?> { .init() }

        var hasPreviousPage: Path<Bool?> { .init() }

        var startCursor: Path<String?> { .init() }

        var endCursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmsEdge {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmsEdge? {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Film {
        var title: Path<String?> { .init() }

        var episodeId: Path<Int?> { .init() }

        var openingCrawl: Path<String?> { .init() }

        var director: Path<String?> { .init() }

        var producers: Path<[String?]?> { .init() }

        var releaseDate: Path<String?> { .init() }

        func speciesConnection(after _: GraphQLArgument<String?> = .argument,
                               first _: GraphQLArgument<Int?> = .argument,
                               before _: GraphQLArgument<String?> = .argument,
                               last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmSpeciesConnection?> {
            return .init()
        }

        var speciesConnection: FragmentPath<SW.FilmSpeciesConnection?> { .init() }

        func starshipConnection(after _: GraphQLArgument<String?> = .argument,
                                first _: GraphQLArgument<Int?> = .argument,
                                before _: GraphQLArgument<String?> = .argument,
                                last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmStarshipsConnection?> {
            return .init()
        }

        var starshipConnection: FragmentPath<SW.FilmStarshipsConnection?> { .init() }

        func vehicleConnection(after _: GraphQLArgument<String?> = .argument,
                               first _: GraphQLArgument<Int?> = .argument,
                               before _: GraphQLArgument<String?> = .argument,
                               last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmVehiclesConnection?> {
            return .init()
        }

        var vehicleConnection: FragmentPath<SW.FilmVehiclesConnection?> { .init() }

        func characterConnection(after _: GraphQLArgument<String?> = .argument,
                                 first _: GraphQLArgument<Int?> = .argument,
                                 before _: GraphQLArgument<String?> = .argument,
                                 last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmCharactersConnection?> {
            return .init()
        }

        var characterConnection: FragmentPath<SW.FilmCharactersConnection?> { .init() }

        func planetConnection(after _: GraphQLArgument<String?> = .argument,
                              first _: GraphQLArgument<Int?> = .argument,
                              before _: GraphQLArgument<String?> = .argument,
                              last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmPlanetsConnection?> {
            return .init()
        }

        var planetConnection: FragmentPath<SW.FilmPlanetsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String> { .init() }

        var node: FragmentPath<SW.Node> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Film? {
        var title: Path<String?> { .init() }

        var episodeId: Path<Int?> { .init() }

        var openingCrawl: Path<String?> { .init() }

        var director: Path<String?> { .init() }

        var producers: Path<[String?]?> { .init() }

        var releaseDate: Path<String?> { .init() }

        func speciesConnection(after _: GraphQLArgument<String?> = .argument,
                               first _: GraphQLArgument<Int?> = .argument,
                               before _: GraphQLArgument<String?> = .argument,
                               last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmSpeciesConnection?> {
            return .init()
        }

        var speciesConnection: FragmentPath<SW.FilmSpeciesConnection?> { .init() }

        func starshipConnection(after _: GraphQLArgument<String?> = .argument,
                                first _: GraphQLArgument<Int?> = .argument,
                                before _: GraphQLArgument<String?> = .argument,
                                last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmStarshipsConnection?> {
            return .init()
        }

        var starshipConnection: FragmentPath<SW.FilmStarshipsConnection?> { .init() }

        func vehicleConnection(after _: GraphQLArgument<String?> = .argument,
                               first _: GraphQLArgument<Int?> = .argument,
                               before _: GraphQLArgument<String?> = .argument,
                               last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmVehiclesConnection?> {
            return .init()
        }

        var vehicleConnection: FragmentPath<SW.FilmVehiclesConnection?> { .init() }

        func characterConnection(after _: GraphQLArgument<String?> = .argument,
                                 first _: GraphQLArgument<Int?> = .argument,
                                 before _: GraphQLArgument<String?> = .argument,
                                 last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmCharactersConnection?> {
            return .init()
        }

        var characterConnection: FragmentPath<SW.FilmCharactersConnection?> { .init() }

        func planetConnection(after _: GraphQLArgument<String?> = .argument,
                              first _: GraphQLArgument<Int?> = .argument,
                              before _: GraphQLArgument<String?> = .argument,
                              last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.FilmPlanetsConnection?> {
            return .init()
        }

        var planetConnection: FragmentPath<SW.FilmPlanetsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String?> { .init() }

        var node: FragmentPath<SW.Node?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Node {
        var id: Path<String> { .init() }

        var film: FragmentPath<SW.Film?> { .init() }

        var species: FragmentPath<SW.Species?> { .init() }

        var planet: FragmentPath<SW.Planet?> { .init() }

        var person: FragmentPath<SW.Person?> { .init() }

        var starship: FragmentPath<SW.Starship?> { .init() }

        var vehicle: FragmentPath<SW.Vehicle?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Node? {
        var id: Path<String?> { .init() }

        var film: FragmentPath<SW.Film?> { .init() }

        var species: FragmentPath<SW.Species?> { .init() }

        var planet: FragmentPath<SW.Planet?> { .init() }

        var person: FragmentPath<SW.Person?> { .init() }

        var starship: FragmentPath<SW.Starship?> { .init() }

        var vehicle: FragmentPath<SW.Vehicle?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmSpeciesConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.FilmSpeciesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var species: FragmentPath<[SW.Species?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmSpeciesConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.FilmSpeciesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var species: FragmentPath<[SW.Species?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmSpeciesEdge {
        var node: FragmentPath<SW.Species?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmSpeciesEdge? {
        var node: FragmentPath<SW.Species?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Species {
        var name: Path<String?> { .init() }

        var classification: Path<String?> { .init() }

        var designation: Path<String?> { .init() }

        var averageHeight: Path<Double?> { .init() }

        var averageLifespan: Path<Int?> { .init() }

        var eyeColors: Path<[String?]?> { .init() }

        var hairColors: Path<[String?]?> { .init() }

        var skinColors: Path<[String?]?> { .init() }

        var language: Path<String?> { .init() }

        var homeworld: FragmentPath<SW.Planet?> { .init() }

        func personConnection(after _: GraphQLArgument<String?> = .argument,
                              first _: GraphQLArgument<Int?> = .argument,
                              before _: GraphQLArgument<String?> = .argument,
                              last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.SpeciesPeopleConnection?> {
            return .init()
        }

        var personConnection: FragmentPath<SW.SpeciesPeopleConnection?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.SpeciesFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.SpeciesFilmsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String> { .init() }

        var node: FragmentPath<SW.Node> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Species? {
        var name: Path<String?> { .init() }

        var classification: Path<String?> { .init() }

        var designation: Path<String?> { .init() }

        var averageHeight: Path<Double?> { .init() }

        var averageLifespan: Path<Int?> { .init() }

        var eyeColors: Path<[String?]?> { .init() }

        var hairColors: Path<[String?]?> { .init() }

        var skinColors: Path<[String?]?> { .init() }

        var language: Path<String?> { .init() }

        var homeworld: FragmentPath<SW.Planet?> { .init() }

        func personConnection(after _: GraphQLArgument<String?> = .argument,
                              first _: GraphQLArgument<Int?> = .argument,
                              before _: GraphQLArgument<String?> = .argument,
                              last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.SpeciesPeopleConnection?> {
            return .init()
        }

        var personConnection: FragmentPath<SW.SpeciesPeopleConnection?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.SpeciesFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.SpeciesFilmsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String?> { .init() }

        var node: FragmentPath<SW.Node?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Planet {
        var name: Path<String?> { .init() }

        var diameter: Path<Int?> { .init() }

        var rotationPeriod: Path<Int?> { .init() }

        var orbitalPeriod: Path<Int?> { .init() }

        var gravity: Path<String?> { .init() }

        var population: Path<Double?> { .init() }

        var climates: Path<[String?]?> { .init() }

        var terrains: Path<[String?]?> { .init() }

        var surfaceWater: Path<Double?> { .init() }

        func residentConnection(after _: GraphQLArgument<String?> = .argument,
                                first _: GraphQLArgument<Int?> = .argument,
                                before _: GraphQLArgument<String?> = .argument,
                                last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PlanetResidentsConnection?> {
            return .init()
        }

        var residentConnection: FragmentPath<SW.PlanetResidentsConnection?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PlanetFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.PlanetFilmsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String> { .init() }

        var node: FragmentPath<SW.Node> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Planet? {
        var name: Path<String?> { .init() }

        var diameter: Path<Int?> { .init() }

        var rotationPeriod: Path<Int?> { .init() }

        var orbitalPeriod: Path<Int?> { .init() }

        var gravity: Path<String?> { .init() }

        var population: Path<Double?> { .init() }

        var climates: Path<[String?]?> { .init() }

        var terrains: Path<[String?]?> { .init() }

        var surfaceWater: Path<Double?> { .init() }

        func residentConnection(after _: GraphQLArgument<String?> = .argument,
                                first _: GraphQLArgument<Int?> = .argument,
                                before _: GraphQLArgument<String?> = .argument,
                                last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PlanetResidentsConnection?> {
            return .init()
        }

        var residentConnection: FragmentPath<SW.PlanetResidentsConnection?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PlanetFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.PlanetFilmsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String?> { .init() }

        var node: FragmentPath<SW.Node?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetResidentsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.PlanetResidentsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var residents: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetResidentsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.PlanetResidentsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var residents: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetResidentsEdge {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetResidentsEdge? {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Person {
        var name: Path<String?> { .init() }

        var birthYear: Path<String?> { .init() }

        var eyeColor: Path<String?> { .init() }

        var gender: Path<String?> { .init() }

        var hairColor: Path<String?> { .init() }

        var height: Path<Int?> { .init() }

        var mass: Path<Double?> { .init() }

        var skinColor: Path<String?> { .init() }

        var homeworld: FragmentPath<SW.Planet?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PersonFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.PersonFilmsConnection?> { .init() }

        var species: FragmentPath<SW.Species?> { .init() }

        func starshipConnection(after _: GraphQLArgument<String?> = .argument,
                                first _: GraphQLArgument<Int?> = .argument,
                                before _: GraphQLArgument<String?> = .argument,
                                last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PersonStarshipsConnection?> {
            return .init()
        }

        var starshipConnection: FragmentPath<SW.PersonStarshipsConnection?> { .init() }

        func vehicleConnection(after _: GraphQLArgument<String?> = .argument,
                               first _: GraphQLArgument<Int?> = .argument,
                               before _: GraphQLArgument<String?> = .argument,
                               last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PersonVehiclesConnection?> {
            return .init()
        }

        var vehicleConnection: FragmentPath<SW.PersonVehiclesConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String> { .init() }

        var node: FragmentPath<SW.Node> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Person? {
        var name: Path<String?> { .init() }

        var birthYear: Path<String?> { .init() }

        var eyeColor: Path<String?> { .init() }

        var gender: Path<String?> { .init() }

        var hairColor: Path<String?> { .init() }

        var height: Path<Int?> { .init() }

        var mass: Path<Double?> { .init() }

        var skinColor: Path<String?> { .init() }

        var homeworld: FragmentPath<SW.Planet?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PersonFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.PersonFilmsConnection?> { .init() }

        var species: FragmentPath<SW.Species?> { .init() }

        func starshipConnection(after _: GraphQLArgument<String?> = .argument,
                                first _: GraphQLArgument<Int?> = .argument,
                                before _: GraphQLArgument<String?> = .argument,
                                last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PersonStarshipsConnection?> {
            return .init()
        }

        var starshipConnection: FragmentPath<SW.PersonStarshipsConnection?> { .init() }

        func vehicleConnection(after _: GraphQLArgument<String?> = .argument,
                               first _: GraphQLArgument<Int?> = .argument,
                               before _: GraphQLArgument<String?> = .argument,
                               last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.PersonVehiclesConnection?> {
            return .init()
        }

        var vehicleConnection: FragmentPath<SW.PersonVehiclesConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String?> { .init() }

        var node: FragmentPath<SW.Node?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonFilmsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.PersonFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonFilmsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.PersonFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonFilmsEdge {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonFilmsEdge? {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonStarshipsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.PersonStarshipsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var starships: FragmentPath<[SW.Starship?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonStarshipsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.PersonStarshipsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var starships: FragmentPath<[SW.Starship?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonStarshipsEdge {
        var node: FragmentPath<SW.Starship?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonStarshipsEdge? {
        var node: FragmentPath<SW.Starship?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Starship {
        var name: Path<String?> { .init() }

        var model: Path<String?> { .init() }

        var starshipClass: Path<String?> { .init() }

        var manufacturers: Path<[String?]?> { .init() }

        var costInCredits: Path<Double?> { .init() }

        var length: Path<Double?> { .init() }

        var crew: Path<String?> { .init() }

        var passengers: Path<String?> { .init() }

        var maxAtmospheringSpeed: Path<Int?> { .init() }

        var hyperdriveRating: Path<Double?> { .init() }

        var mglt: Path<Int?> { .init() }

        var cargoCapacity: Path<Double?> { .init() }

        var consumables: Path<String?> { .init() }

        func pilotConnection(after _: GraphQLArgument<String?> = .argument,
                             first _: GraphQLArgument<Int?> = .argument,
                             before _: GraphQLArgument<String?> = .argument,
                             last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.StarshipPilotsConnection?> {
            return .init()
        }

        var pilotConnection: FragmentPath<SW.StarshipPilotsConnection?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.StarshipFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.StarshipFilmsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String> { .init() }

        var node: FragmentPath<SW.Node> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Starship? {
        var name: Path<String?> { .init() }

        var model: Path<String?> { .init() }

        var starshipClass: Path<String?> { .init() }

        var manufacturers: Path<[String?]?> { .init() }

        var costInCredits: Path<Double?> { .init() }

        var length: Path<Double?> { .init() }

        var crew: Path<String?> { .init() }

        var passengers: Path<String?> { .init() }

        var maxAtmospheringSpeed: Path<Int?> { .init() }

        var hyperdriveRating: Path<Double?> { .init() }

        var mglt: Path<Int?> { .init() }

        var cargoCapacity: Path<Double?> { .init() }

        var consumables: Path<String?> { .init() }

        func pilotConnection(after _: GraphQLArgument<String?> = .argument,
                             first _: GraphQLArgument<Int?> = .argument,
                             before _: GraphQLArgument<String?> = .argument,
                             last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.StarshipPilotsConnection?> {
            return .init()
        }

        var pilotConnection: FragmentPath<SW.StarshipPilotsConnection?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.StarshipFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.StarshipFilmsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String?> { .init() }

        var node: FragmentPath<SW.Node?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipPilotsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.StarshipPilotsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var pilots: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipPilotsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.StarshipPilotsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var pilots: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipPilotsEdge {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipPilotsEdge? {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipFilmsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.StarshipFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipFilmsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.StarshipFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipFilmsEdge {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipFilmsEdge? {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonVehiclesConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.PersonVehiclesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var vehicles: FragmentPath<[SW.Vehicle?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonVehiclesConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.PersonVehiclesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var vehicles: FragmentPath<[SW.Vehicle?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonVehiclesEdge {
        var node: FragmentPath<SW.Vehicle?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PersonVehiclesEdge? {
        var node: FragmentPath<SW.Vehicle?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Vehicle {
        var name: Path<String?> { .init() }

        var model: Path<String?> { .init() }

        var vehicleClass: Path<String?> { .init() }

        var manufacturers: Path<[String?]?> { .init() }

        var costInCredits: Path<Double?> { .init() }

        var length: Path<Double?> { .init() }

        var crew: Path<String?> { .init() }

        var passengers: Path<String?> { .init() }

        var maxAtmospheringSpeed: Path<Int?> { .init() }

        var cargoCapacity: Path<Double?> { .init() }

        var consumables: Path<String?> { .init() }

        func pilotConnection(after _: GraphQLArgument<String?> = .argument,
                             first _: GraphQLArgument<Int?> = .argument,
                             before _: GraphQLArgument<String?> = .argument,
                             last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.VehiclePilotsConnection?> {
            return .init()
        }

        var pilotConnection: FragmentPath<SW.VehiclePilotsConnection?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.VehicleFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.VehicleFilmsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String> { .init() }

        var node: FragmentPath<SW.Node> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.Vehicle? {
        var name: Path<String?> { .init() }

        var model: Path<String?> { .init() }

        var vehicleClass: Path<String?> { .init() }

        var manufacturers: Path<[String?]?> { .init() }

        var costInCredits: Path<Double?> { .init() }

        var length: Path<Double?> { .init() }

        var crew: Path<String?> { .init() }

        var passengers: Path<String?> { .init() }

        var maxAtmospheringSpeed: Path<Int?> { .init() }

        var cargoCapacity: Path<Double?> { .init() }

        var consumables: Path<String?> { .init() }

        func pilotConnection(after _: GraphQLArgument<String?> = .argument,
                             first _: GraphQLArgument<Int?> = .argument,
                             before _: GraphQLArgument<String?> = .argument,
                             last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.VehiclePilotsConnection?> {
            return .init()
        }

        var pilotConnection: FragmentPath<SW.VehiclePilotsConnection?> { .init() }

        func filmConnection(after _: GraphQLArgument<String?> = .argument,
                            first _: GraphQLArgument<Int?> = .argument,
                            before _: GraphQLArgument<String?> = .argument,
                            last _: GraphQLArgument<Int?> = .argument) -> FragmentPath<SW.VehicleFilmsConnection?> {
            return .init()
        }

        var filmConnection: FragmentPath<SW.VehicleFilmsConnection?> { .init() }

        var created: Path<String?> { .init() }

        var edited: Path<String?> { .init() }

        var id: Path<String?> { .init() }

        var node: FragmentPath<SW.Node?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehiclePilotsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.VehiclePilotsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var pilots: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehiclePilotsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.VehiclePilotsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var pilots: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehiclePilotsEdge {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehiclePilotsEdge? {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehicleFilmsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.VehicleFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehicleFilmsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.VehicleFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehicleFilmsEdge {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehicleFilmsEdge? {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetFilmsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.PlanetFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetFilmsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.PlanetFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetFilmsEdge {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetFilmsEdge? {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesPeopleConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.SpeciesPeopleEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var people: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesPeopleConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.SpeciesPeopleEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var people: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesPeopleEdge {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesPeopleEdge? {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesFilmsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.SpeciesFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesFilmsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.SpeciesFilmsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var films: FragmentPath<[SW.Film?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesFilmsEdge {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesFilmsEdge? {
        var node: FragmentPath<SW.Film?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmStarshipsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.FilmStarshipsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var starships: FragmentPath<[SW.Starship?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmStarshipsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.FilmStarshipsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var starships: FragmentPath<[SW.Starship?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmStarshipsEdge {
        var node: FragmentPath<SW.Starship?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmStarshipsEdge? {
        var node: FragmentPath<SW.Starship?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmVehiclesConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.FilmVehiclesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var vehicles: FragmentPath<[SW.Vehicle?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmVehiclesConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.FilmVehiclesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var vehicles: FragmentPath<[SW.Vehicle?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmVehiclesEdge {
        var node: FragmentPath<SW.Vehicle?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmVehiclesEdge? {
        var node: FragmentPath<SW.Vehicle?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmCharactersConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.FilmCharactersEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var characters: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmCharactersConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.FilmCharactersEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var characters: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmCharactersEdge {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmCharactersEdge? {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmPlanetsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.FilmPlanetsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var planets: FragmentPath<[SW.Planet?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmPlanetsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.FilmPlanetsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var planets: FragmentPath<[SW.Planet?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmPlanetsEdge {
        var node: FragmentPath<SW.Planet?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.FilmPlanetsEdge? {
        var node: FragmentPath<SW.Planet?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PeopleConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.PeopleEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var people: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PeopleConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.PeopleEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var people: FragmentPath<[SW.Person?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PeopleEdge {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PeopleEdge? {
        var node: FragmentPath<SW.Person?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.PlanetsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var planets: FragmentPath<[SW.Planet?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.PlanetsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var planets: FragmentPath<[SW.Planet?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetsEdge {
        var node: FragmentPath<SW.Planet?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.PlanetsEdge? {
        var node: FragmentPath<SW.Planet?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.SpeciesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var species: FragmentPath<[SW.Species?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.SpeciesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var species: FragmentPath<[SW.Species?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesEdge {
        var node: FragmentPath<SW.Species?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.SpeciesEdge? {
        var node: FragmentPath<SW.Species?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipsConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.StarshipsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var starships: FragmentPath<[SW.Starship?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipsConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.StarshipsEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var starships: FragmentPath<[SW.Starship?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipsEdge {
        var node: FragmentPath<SW.Starship?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.StarshipsEdge? {
        var node: FragmentPath<SW.Starship?> { .init() }

        var cursor: Path<String?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehiclesConnection {
        var pageInfo: FragmentPath<SW.PageInfo> { .init() }

        var edges: FragmentPath<[SW.VehiclesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var vehicles: FragmentPath<[SW.Vehicle?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehiclesConnection? {
        var pageInfo: FragmentPath<SW.PageInfo?> { .init() }

        var edges: FragmentPath<[SW.VehiclesEdge?]?> { .init() }

        var totalCount: Path<Int?> { .init() }

        var vehicles: FragmentPath<[SW.Vehicle?]?> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehiclesEdge {
        var node: FragmentPath<SW.Vehicle?> { .init() }

        var cursor: Path<String> { .init() }
    }

    extension GraphQLFragmentPath where UnderlyingType == SW.VehiclesEdge? {
        var node: FragmentPath<SW.Vehicle?> { .init() }

        var cursor: Path<String?> { .init() }
    }

#endif









