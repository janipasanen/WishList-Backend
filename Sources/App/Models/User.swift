//
//  Users.swift
//  
//
//  Created by Jani Pasanen on 2021-05-05.
//

import Fluent
import Vapor

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "email")
    var email: String
    
    @Field(key: "name")
    var name: String?

    init() { }

    init(id: UUID? = nil, email: String, name: String?) {
        self.id = id
        self.email = email
        self.name = name
    }
}
