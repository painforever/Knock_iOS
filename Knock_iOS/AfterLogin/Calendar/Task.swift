//
//  Task.swift
//  Knock_iOS
//
//  Created by yusong on 11/10/21.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

//Total task meta view
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

//sample date for testing
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

//sample tasks for testing
var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "Drink a bucket of beer."),
        Task(title: "Review 2 question about Backtrack in Leetcode."),
        Task(title: "Do some workouts at night today.")
    ], taskDate: getSampleDate(offset: 1)),
    
    TaskMetaData(task: [
        Task(title: "Talk to Elon Muck.")
    ], taskDate: getSampleDate(offset: -3)),
    
    TaskMetaData(task: [
        Task(title: "Meet with Bill Gates.")
    ], taskDate: getSampleDate(offset: -8))
]



