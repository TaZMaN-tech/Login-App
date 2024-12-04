struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(username: "User", password: "Password", person: Person.getPerson())
    }
}

struct Person {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    let age: Int
    let birthDate: String
    let city: String
    let country: String
    let bio: String
    
    static func getPerson() -> Person {
        Person(
            firstName: "Тадевос",
            lastName: "Курдоглян",
            age: 34,
            birthDate: "13.02.1990",
            city: "Санкт-Петербург",
            country: "Россия",
            bio: "Тут что-нибудь обо мне :)"

        )
    }
}
