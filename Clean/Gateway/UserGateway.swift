//
//  UserGateway.swift
//  Clean
//
//  Created by Javier Pineda Gonzalez on 22/08/22.
//

import Foundation

protocol AnyGateway {
    var useCase: AnyUseCase? { get set }
    
    func fetchUsers()
}

class UserGateway: AnyGateway {
    var useCase: AnyUseCase?
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data,
                  error == nil else {
                      self?.useCase?.fetchUsers(with: .failure(FetchError.failed))
                return
            }
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.useCase?.fetchUsers(with: .success(entities))
            } catch {
                self?.useCase?.fetchUsers(with: .failure(error))
            }
        }
        task.resume()
    }
}
