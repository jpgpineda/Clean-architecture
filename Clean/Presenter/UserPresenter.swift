//
//  UserPresenter.swift
//  Clean
//
//  Created by Javier Pineda Gonzalez on 22/08/22.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var view: AnyView? { get set }
    var useCase: AnyUseCase? { get set }
    
    func fetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var view: AnyView?
    
    var useCase: AnyUseCase?
    
    func fetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.updateList(with: users)
        case .failure(let error):
            view?.showErrorMessage(message: error.localizedDescription)
        }
    }
}
