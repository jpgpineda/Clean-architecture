//
//  UserRouter.swift
//  Clean
//
//  Created by Javier Pineda Gonzalez on 22/08/22.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        <#code#>
    }
    
}
