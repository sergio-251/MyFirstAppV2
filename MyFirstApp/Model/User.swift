//
//  User.swift
//  MyFirstApp
//
//  Created by Sergey Efimov on 18.12.2021.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let age: Int
    let description: String
    let user: User
    
    static func getAnyPerson() -> Person {
        Person(
            name: "Sergey",
            surname: "Efimov",
            age: 39,
            description: "Hello, everybody. I like play guitar and read " +
            "interesting books.",
            user: User(
                login: "Sergio",
                password: "251"
            ))}
}

struct User {
    let login: String
    let password: String
}
