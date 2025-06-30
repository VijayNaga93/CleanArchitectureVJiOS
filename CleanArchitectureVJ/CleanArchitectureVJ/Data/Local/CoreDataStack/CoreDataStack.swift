//
//  CoreDataStack.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 01/07/25.
//

import Foundation

// CoreData Flow:
//final class CoreDataStack {
//    static let shared = CoreDataStack()
//
//    let container: NSPersistentContainer
//
//    private init() {
//        container = NSPersistentContainer(name: "CleanArchitectureVJModel")
//        container.loadPersistentStores { _, error in
//            if let error = error { fatalError("CoreData failed \(error)") }
//        }
//    }
//}
