//
//  PostController.swift
//  
//
//  Created by Joephery Rafael on 10/22/22.
//

import Fluent
import Vapor

struct PostController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let posts = routes.grouped("posts")
        posts.get(use: index)
        posts.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Posts]> {
        return Posts.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let post = try req.content.decode(Posts.self)
        return post.save(on: req.db).transform(to: .ok)
    }
}
