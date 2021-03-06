import Combine

struct CombineRPG {
    var text = "Hello, World!"
}

/**
 protocol Publisher
 protocol Cancellable
 protocol ConnectablePublisher
 protocol Subscriber
 protocol Subscription
 protocol Subject
 protocol Scheduler
 protocol SchedulerTimeIntervalConvertible
 protocol ObservableObject
 protocol TopLevelEncoder
 protocol TopLevelDecoder
 protocol CustomCombineIdentifierConvertible
 */
class Starter:Publisher {
    public init() {
        Swift.print(Self.self, "\t", #function)
    }
    typealias Output = String
    typealias Failure = Never
    let value = "hello world"
    func receive<AnySubscriber>(subscriber: AnySubscriber)
    where AnySubscriber : Subscriber, Failure == AnySubscriber.Failure, Output == AnySubscriber.Input {
        Swift.print(Self.self, "\t", #function)
        let sub = Listener(downStreamSubscriber: subscriber, value: value)
        subscriber.receive(subscription: sub)
        
    }
    deinit {
        Swift.print(Self.self, "\t", #function)
    }
}
class Mapper<UpstreamPublisher>: Publisher where UpstreamPublisher:Publisher, UpstreamPublisher.Output == String, UpstreamPublisher.Failure == Never {
    internal init(upstream: UpstreamPublisher) {
        self.upstreamPublisher = upstream
    }
    
    typealias Output = String
    typealias Failure = Never
    let upstreamPublisher: UpstreamPublisher
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        
        upstreamPublisher.receive(subscriber: MapperSubscriber(downStream: subscriber))
    }
    deinit {
        Swift.print(Self.self, "\t", #function)
    }
}
class MapperSubscriber<DownStream>: Subscriber where DownStream: Subscriber, DownStream.Input == String, DownStream.Failure == Never {
    func receive(subscription: Subscription) {
        downStream.receive(subscription: subscription)
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        downStream.receive(input + " by yu")
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        downStream.receive(completion: completion)
    }
    
    typealias Input = String
    
    typealias Failure = Never
    
    internal init(downStream: DownStream) {
        self.downStream = downStream
    }
    
    let downStream: DownStream
    deinit {
            Swift.print(Self.self, "\t", #function)
        }
}
class Listener<DownStream>: Subscription where DownStream: Subscriber, DownStream.Input == String {
    internal init(downStreamSubscriber: DownStream? = nil, value: String) {
        print(Self.self, "\t", #function)
        self.downStream = downStreamSubscriber
        self.value = value
    }
    
    var downStream: DownStream?
    let value: String
    func request(_ demand: Subscribers.Demand) {
        print(Self.self, "\t", #function)
        _ = downStream?.receive(value)
        downStream?.receive(completion: .finished)
        cancel()
    }
    
    func cancel() {
        print(Self.self, "\t", #function)
    }
    
    let combineIdentifier: CombineIdentifier = CombineIdentifier()
    
    deinit {
        Swift.print(Self.self, "\t", #function)
    }
}

class Finisher: Subscriber {
    init() {
        Swift.print(Self.self, "\t", #function)
    }
    
    typealias Input = String
    typealias Failure = Never
    let combineIdentifier: CombineIdentifier = .init()
    
    func receive(subscription: Subscription) {
        print(Self.self, "\t", #function)
        subscription.request(.unlimited)
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print(Self.self, "\t", #function)
        print(input)
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print(Self.self, "\t", #function)
    }
    deinit {
        Swift.print(Self.self, "\t", #function)
    }
}
