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
    
}
