//
//  UserUseCase.swift
//  Clean
//
//  Created by Javier Pineda Gonzalez on 22/08/22.
//

import Foundation

protocol AnyUseCase {
    var presenter: AnyPresenter? { get set }
    var gateway: AnyGateway? { get set }
    
    func fetchUsers(with result: Result<[User], Error>)
}

class UserUseCase: AnyUseCase {
    var presenter: AnyPresenter?
    
    var gateway: AnyGateway? {
        didSet {
            gateway?.fetchUsers()
        }
    }
    
    func fetchUsers(with result: Result<[User], Error>) {
        presenter?.fetchUsers(with: result)
    }
}
