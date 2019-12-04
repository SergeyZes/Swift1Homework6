import UIKit

//Задание 1
struct Queue<T: CustomStringConvertible>: CustomStringConvertible {
    private var elements = [T]()
 
    var description: String {
        return elements.reduce(""){
            $0 + $1.description + "; "
        }
    }
    
    mutating func add(_ element: T) {
        elements.append(element)
    }
    
    mutating func extractFirst() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
}

var q1 = Queue<String>()

q1.add("Биробиджан")
q1.add("Москва")
q1.add("Санкт-Петербург")

print("Задание 1")
print("Первый извлеченный элемент - \(q1.extractFirst()!)")
print("Состав очереди - \(q1)")
print("")

//Задание 2
struct Queue2<T: CustomStringConvertible & Comparable>: CustomStringConvertible {
    private var elements = [T]()
    
    var description: String {
        return elements.reduce(""){
            $0 + $1.description + "; "
        }
    }

    mutating func add(_ element: T) {
        elements.append(element)
    }
    mutating func extractFirst() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    
    func filter(_ predicate: (T) -> Bool) -> Queue2<T> {
        var newQueue = Queue2()
        elements.forEach { (element) in
            if predicate(element) {
                newQueue.add(element)
            }
        }
        return newQueue
    }
    
    func sort(_ predicate: (T,T) -> Bool) -> Queue2<T> {
        var newQueue = Queue2()
        let newElements = elements.sorted(by: predicate)
        newElements.forEach { (element) in
                newQueue.add(element)
        }
        return newQueue
    }
    
}

var q2 = Queue2<String>()
q2.add("Уфа")
q2.add("Анапа")
q2.add("Оха")
q2.add("Москва")
q2.add("Санкт-Петербург")
q2.add("Ростов")
q2.add("Апатиты")
q2.add("Копейск")

var q3 = q2.filter { $0.count > 3 }
var q4 = q3.sort { $0 < $1 }

print("Задание 2")
print("Изначальный состав очереди - \(q2)")
print("Состав очереди после фильтра - \(q3)")
print("Состав очереди после сортировки - \(q4)")
print("")

//Задание 3
struct Queue3<T: CustomStringConvertible & Comparable>: CustomStringConvertible {
    private var elements = [T]()
    
    var description: String {
        return elements.reduce(""){
            $0 + $1.description + "; "
        }
    }

    mutating func add(_ element: T) {
        elements.append(element)
    }
    mutating func extractFirst() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    
    func filter(_ predicate: (T) -> Bool) -> Queue3<T> {
        var newQueue = Queue3()
        elements.forEach { (element) in
            if predicate(element) {
                newQueue.add(element)
            }
        }
        return newQueue
    }
    
    func sort(_ predicate: (T,T) -> Bool) -> Queue3<T> {
        var newQueue = Queue3()
        let newElements = elements.sorted(by: predicate)
        newElements.forEach { (element) in
                newQueue.add(element)
        }
        return newQueue
    }
    
    subscript (indexes: Int ...) -> Queue3<T>? {
        var newQueue = Queue3()
        for index in indexes {
            if index < 0 || index > (elements.count - 1) { return nil }
            newQueue.add(elements[index])
        }
        return newQueue
    }
    
}

var qq1 = Queue3<String>()
qq1.add("Уфа")
qq1.add("Анапа")
qq1.add("Оха")
qq1.add("Москва")
qq1.add("Санкт-Петербург")
qq1.add("Ростов")
qq1.add("Апатиты")
qq1.add("Копейск")



print("Задание 3")
print("Изначальный состав очереди - \(qq1)")

if let qq2 = qq1[1,5,7] {
    print("Состав очереди [1,5,7] - \(qq2)")
} else {
    print("Очередь [1,5,7] - пуста")
}

if let qq3 = qq1[1,15,3] {
    print("Состав очереди - \(qq3)")
} else {
    print("Очередь [1,15,3] - пуста")
}
