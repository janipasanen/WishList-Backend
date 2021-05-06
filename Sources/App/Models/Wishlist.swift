//
//  Wishlist.swift
//  
//
//  Created by Jani Pasanen on 2021-05-05.
//

import Fluent
import Vapor

final class Wishlist: Model, Content {
    static let schema = "wishlists"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "wishlistitems")
    var wishlistitems: [Wishlistitem?]

    init() { }

    init(id: UUID? = nil, wishlistitems: [Wishlistitem?]) {
        self.id = id
        self.wishlistitems = wishlistitems
    }
}
