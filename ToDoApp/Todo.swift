//
//  Todo.swift
//  ToDoApp
//
//  Created by Klaudia on 27.01.2017.
//  Copyright © 2017 Klaudia. All rights reserved.
//

import Foundation

class Todo {
    var _id: String?
    var name: String?
    var note: String?
    var createdAt: String?
    var updatedAt: String?
    var completed: Bool?
    
    init(_id: String, name: String, note: String, createdAt: String, updatedAt: String, completed: Bool) {
        self._id = _id
        self.name = name
        self.note = note
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.completed = completed
    }
}
