import Combine
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//let numbersPublisher = [1, 2, 3, 4].publisher
//
//let subscriber = Subscribers.Sink<Int, Never>(receiveCompletion: { print($0) }) {
//    print($0)
//}
//
//numbersPublisher.subscribe(subscriber)
//
//let subscription = numbersPublisher.sink(receiveCompletion: { print($0) }) {
//    print($0)
//}
//
//subscription.cancel()
//
//
//
//class Forum {
//
//    var latestMessage: String = "" {
//        didSet {
//            print("Message: \(latestMessage)")
//        }
//    }
//
//}
//
//let forum = Forum()
//forum.latestMessage = "Test message"
//
//let messagesPublisher = ["Message one", "Message two"].publisher
//
//let messagesSubscriber = Subscribers.Assign<Forum, String>(object: forum, keyPath: \.latestMessage)
//
//messagesPublisher.subscribe(messagesSubscriber)
//
//messagesPublisher.assign(to: \.latestMessage, on: forum)
//
//
//class Emitter {
//
//    var subscriptions = Set<AnyCancellable>()
//
//    init() {
//        Timer.publish(every: 1, on: RunLoop.main, in: .common)
//            .autoconnect()
//            .sink {
//                print("New event \($0)")
//            }.store(in: &subscriptions)
//    }
//
//}
//
//var emiter: Emitter? = Emitter()
//print("test")
//
//emiter = nil
//
//enum CustomError: Error {
//
//    case someError
//
//}
//
//let passthroughSubject = PassthroughSubject<String, CustomError>()
//
//passthroughSubject.sink(receiveCompletion: { print($0) }) {
//        print($0)
//    }
//
//passthroughSubject.send("ABC")
////passthroughSubject.send(completion: .finished)
//
//passthroughSubject.sink(receiveCompletion: { print($0) }) {
//        print($0)
//    }
//
//passthroughSubject.send("---")
//passthroughSubject.send(completion: .failure(.someError))
//passthroughSubject.send("DEF")
//
//let currentValue = CurrentValueSubject<String, Never>("empty")
//
//currentValue.send("aaa")
//
//currentValue.sink(receiveCompletion: { print($0) }) {
//    print($0)
//}
//
//[1, 2, 3].publisher
//    .map { $0 * 10 }
//    .filter { $0 < 20 }
//    .sink { print($0) }
//
//["s", "w", "w",  "i", "f", "t"].publisher
//    .removeDuplicates()
//    .scan("") { $0 + $1 }
//    .sink { print($0) }
//
//[96.0, 12.0, 11, 100].publisher
//    .scan((avg: 0.0, sum: 0.0, count: 0)) { (tuple, value) in
//        let sum = tuple.sum + value
//        let count = tuple.count + 1
//        let avg = tuple.sum / Double(count)
//        return (avg: avg, sum: sum, count: count)
//    }
//    .sink { print($0) }
//
//[96.0, 12.0, 11, 100].publisher
//    .print()
//    .collect()
//    .sink { print($0) }
//
//let publisherOne = CurrentValueSubject<Int, Never>(100)
//let publisherTwo = [1, 2, 3, 4].publisher
//
//publisherOne.merge(with: publisherTwo)
//    .sink { print($0) }
//
//publisherOne.send(99)
//
//let ints = [1, 2, 3].publisher
//let letters = ["a", "b"].publisher
//
//ints.zip(letters)
//    .map { "\($0)-\($1)" }
//    .sink { print($0) }


//let requests = ["https://apple.com", "http://reactivex.io"]
//    .publisher
//    .map { URL(string: $0)! }
//    .flatMap { URLSession.shared.dataTaskPublisher(for: $0).assertNoFailure() }
//    .sink { (data, response) in
//        print("Bytes \(data.count) from \(response.url!)")
//    }
//
//let firstRequest = Just("https://apple.com")
//    .map { URL(string: $0)! }
//    .flatMap { URLSession.shared.dataTaskPublisher(for: $0) }
//
//let secondRequest = Just("http://reactivex.io")
//    .map { URL(string: $0)! }
//    .flatMap { URLSession.shared.dataTaskPublisher(for: $0)}
//
//
//let results = firstRequest.zip(secondRequest)
//    .sink(receiveCompletion: { print($0) }) { firstResult, secondResult in
//        print("\(firstResult.data.count) - \(secondResult.data.count)")
//    }


enum CustomError: Error {

    case someError

}

let passthroughSubject = PassthroughSubject<String, CustomError>()

passthroughSubject
//    .catch { error -> AnyPublisher<String, Never> in
//        print(error)
//        return ["a", "b"].publisher
//            .eraseToAnyPublisher()
//
    .tryMap {
        if $0.count < 3 {
            throw CustomError.someError
        } else {
            return $0
        }
    }
    .replaceError(with: "invalid")
    .sink(receiveCompletion: { print($0) }) {
        print($0)
    }

passthroughSubject.send("1")
passthroughSubject.send(completion: .failure(.someError))
passthroughSubject.send("2")


let numbers = [1, 2, 3].publisher
    .setFailureType(to: Error.self)
let otherPublisher = PassthroughSubject<Int, Error>()

numbers.merge(with: otherPublisher)
