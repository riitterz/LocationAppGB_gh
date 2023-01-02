//
//  ViewModel.swift
//  FrameworkCombine
//
//  Created by Macbook on 29.12.2022.
//

import Foundation
import Combine

//---------2--------
class ViewModel {
    let apiClient: APIClient
    let character: AnyPublisher<Character, NetworkError>
    
    internal init(
        apiClient: APIClient,
        inputIdentifiersPublisher: AnyPublisher<Int, Never>
    ) {
        self.apiClient = apiClient
        let networking = inputIdentifiersPublisher.map {
            apiClient.character(id: $0)
        }
            .switchToLatest()
            .share()
        self.character = networking.eraseToAnyPublisher()
    }
}
