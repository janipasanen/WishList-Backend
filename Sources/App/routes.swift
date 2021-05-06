import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }

    let todoController = TodoController()
    try app.register(collection: todoController)
    
    let userController = UsersController()
    try app.register(collection: userController)
    
    let wishlistController = WishlistsController()
    try app.register(collection: wishlistController)
    
}
