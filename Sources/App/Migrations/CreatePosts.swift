//
//  CreatePosts.swift
//  
//
//  Created by Joephery Rafael on 10/22/22.
//

import Fluent

struct CreatePosts: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("posts")
            .id()
            .field("postType", .string, .required)
            .field("message", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("posts").delete()
    }
}
