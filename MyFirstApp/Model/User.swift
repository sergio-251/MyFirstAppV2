//
//  User.swift
//  MyFirstApp
//
//  Created by Sergey Efimov on 18.12.2021.
//

struct Person {
    let name: String
    let surname: String
    let age: Int
    let user: User
    
    static func getAnyPerson() -> Person {
        Person(
            name: "Sergey",
            surname: "Efimov",
            age: 39,
            user: User(
                login: "Sergio",
                password: "251"
            ))}
}

struct User {
    let login: String
    let password: String
}
