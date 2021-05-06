//
//  WishlistController.swift
//  
//
//  Created by Jani Pasanen on 2021-05-05.
//

import Fluent
import Vapor

struct WishlistsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let wishlists = routes.grouped("wishlists")
        wishlists.get(use: index)
        wishlists.post(use: create)
        wishlists.get(use: getAllHandler)
        wishlists.group(":wishlistID") { todo in
            todo.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Wishlist]> {
        return Wishlist.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Wishlist> {
        let wishlist = try req.content.decode(Wishlist.self)
        return wishlist.save(on: req.db).map { wishlist }
    }
    
    func getAllHandler(_ req: Request) -> EventLoopFuture<[Wishlist]> {
        Wishlist.query(on: req.db).all()
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Wishlist.find(req.parameters.get("wishlistID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
