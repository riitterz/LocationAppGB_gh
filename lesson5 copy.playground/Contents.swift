import UIKit
import Combine

//---------3--------
//MARK: - оператор .shared()
let shared = URLSession.shared
    .dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character/50")!)
    .map(\.data)
    .print("shared")
    .share()

print("subscribing first")
let subscription1 = shared
    .sink(
        receiveCompletion: { _ in },
        receiveValue: { print("subscription1 received: '\($0)'") }
)

print("subscribing second")
let subscription2 = shared .sink(
    receiveCompletion: { _ in },
    receiveValue: { print("subscription2 received: '\($0)'") }
)

//MARK: - оператор .multicast()
let subject = PassthroughSubject<Data, URLError>()
let multicasted = URLSession.shared
    .dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character/50")!)
    .map(\.data)
    .print("shared")
    .multicast(subject: subject)

let subscription3 = multicasted
    .sink(
        receiveCompletion: { _ in },
        receiveValue: { print("subscription1 received: '\($0)'") }
    )

let subscription4 = multicasted
    .sink(
        receiveCompletion: { _ in },
        receiveValue: { print("subscription2 received: '\($0)'") }
    )
multicasted.connect()
subject.send(Data())


