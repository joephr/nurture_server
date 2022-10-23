//
//  File.swift
//  
//
//  Created by Joephery Rafael on 10/22/22.
//

import Fluent
import Vapor

final class Posts: Model, Content {
    static let schema = "posts"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "postType")
    var postType: String
    
    @Field(key: "message")
    var message: String
    
    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.postType = postType
        self.message = message
    }
}
