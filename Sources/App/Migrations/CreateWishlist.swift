//
//  File.swift
//
//
//  Created by Jani Pasanen on 2021-05-05.
//

import Fluent

struct CreateWishlist: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users")
            .id()
            //TODO - change data type of wishlistitems to array of wishlistitem (make sure it is of type databasschea.datatype)
            .field("wishlistitems", .string, .required)
            .create()
    
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users").delete()
    }
}
