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
    let title: String
    let description: String?
    let isCompleted: Bool
    let createdAt: Date
}

