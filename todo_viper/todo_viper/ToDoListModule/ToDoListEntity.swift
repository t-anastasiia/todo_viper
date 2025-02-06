//
//  ToDoListEntity.swift
//  todo_viper
//
//  Created by Анастасия Талмазан on 2025-02-01.
//

import UIKit

// entity используется в рамках класса Interactor

struct ToDoItem {
    let id: Int
    var title: String
    var description: String?
    var isCompleted: Bool
    let createdAt: Date
}

