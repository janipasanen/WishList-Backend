//
//  wishlistitems.swift
//  
//
//  Created by Jani Pasanen on 2021-05-05.
//

import Fluent
import Vapor

final class Wishlistitem: Model, Content {
    static let schema = "wishlistitems"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "wishlistid")
    var wishlistid: UUID?

    @Field(key: "nameofwish")
    var nameofwish: String?
    
    @Field(key: "link")
    var link: String?

    init() { }

    init(id: UUID? = nil, wishlistid: UUID? = nil, nameofwish: String?, link: String?) {
        self.id = id
        self.wishlistid = wishlistid
        self.nameofwish = nameofwish
        self.link = link
    }
}
