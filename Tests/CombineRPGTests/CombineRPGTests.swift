import XCTest
@testable import CombineRPG

final class CombineRPGTests: XCTestCase {
    /**
     Starter      init()
     Finisher      init()
     Starter      receive(subscriber:)
     Listener<MapperListener<Finisher>>      init(downStream:value:)
     Finisher      receive(subscription:)
     Listener<MapperListener<Finisher>>      request(_:)
     Finisher      receive(_:)
     hello world by yu
     Finisher      receive(completion:)
     Listener<MapperListener<Finisher>>      cancel()
     Listener<MapperListener<Finisher>>      deinit
     MapperListener<Finisher>      deinit
     Finisher      deinit
     Mapper<Starter>      deinit
     Starter      deinit
     13
     */
    func test_mapper_start() throws {
        var starter:Starter? = Starter()
        var mapper:Mapper? = Mapper(upstream: starter!)
        starter = nil
        var finisher:Finisher? = Finisher()
        mapper!.receive(subscriber: finisher!)
        finisher = nil
        mapper = nil
        print(#line)
    }
    /**
     Starter      init()
     Finisher      init()
     Listener<MapperSubscriber<Finisher>>      init(downStreamSubscriber:value:)
     Starter      deinit
     Listener<MapperSubscriber<Finisher>>      request(_:)
     Finisher      receive(_:)
     hello world by yu
     Finisher      receive(completion:)
     Listener<MapperSubscriber<Finisher>>      cancel()
     Listener<MapperSubscriber<Finisher>>      deinit
     MapperSubscriber<Finisher>      deinit
     Finisher      deinit
     44
     */
    func test_listener_Start() throws {
        var starter:Starter! = Starter()
        
        var finisher:Finisher! = Finisher()
        var mappedFinisher:MapperSubscriber! = MapperSubscriber(downStream: finisher!)
        var listener:Listener! = Listener(downStreamSubscriber: mappedFinisher, value: starter!.value)
        mappedFinisher = nil
        starter = nil
        finisher = nil
        listener.request(.max(1))
        listener = nil
        print(#line)
    }

}
