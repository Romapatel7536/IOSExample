import UIKit
import Combine

func subjectExample() {
    let passThroughObject = PassthroughSubject<String,Error> ()
    passThroughObject.send("hello")
    passThroughObject.sink { _ in
        fatalError()
    } receiveValue: { value in
        print(value)
    }
    passThroughObject.send("world")

    let currentObject = CurrentValueSubject<String, Error>("initial Value")
    currentObject.send("Hello2")
    currentObject.send("World2")
    currentObject.sink { _ in
        fatalError()
    } receiveValue: { value in
        print(value)
    }
    currentObject.send("World3")
    currentObject.send("World4")
}
 20
let example: () = subjectExample()
print(example)

print("------")

let relay = PassthroughSubject<String, Never>()
let publisher = ["Here","we","go!"].publisher
print(publisher.subscribe(relay))


let variable = CurrentValueSubject<String, Never>("")
variable.send("Initial text456")

let subscription2 = variable.sink { value in
    print("subscription2 received value: \(value)")
}
variable.send("More text")
variable.send("More text2")
variable.send("More text3")
print("++++++")


let publisher1 = Just(42)
let subscription1 = publisher1.sink { value in
    print("Received value from publisher1: \(value)")
}


let num1 = PassthroughSubject<Int, Never>()
let num2 = PassthroughSubject<Int, Never>()

 let cancellable = num2
    .combineLatest(num1)
    .sink { print("Result: \($0).") }
num1.send(15)
num2.send(100)
num1.send(10)
num1.send(2)
num2.send(5)
num2.send(25)
num2.send(40)
num1.send(11)



