//
//  UserViewController.swift
//  Clean
//
//  Created by Javier Pineda Gonzalez on 22/08/22.
//

import Foundation

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    func updateList(with users: [User])
    func showErrorMessage(message: String)
}

class UserViewController: AnyView {
    var presenter: AnyPresenter?
    
    func updateList(with users: [User]) {
        <#code#>
    }
    
    func showErrorMessage(message: String) {
        <#code#>
    }
}



