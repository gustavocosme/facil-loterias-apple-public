//
//  Service.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 22/05/23.
//

import Foundation
import Combine
import Alamofire

// MARK: - Protocols

protocol ServiceProtocol {
    func fetch(_ router: String, id: String) -> AnyPublisher<DataResponse<SortData, NetworkError>, Never>
}

class Service {
    static let shared: ServiceProtocol = Service()
    private let SERVER = "https://servicebus2.caixa.gov.br/portaldeloterias/api/"
}


// MARK: - ServiceProtocol

extension Service: ServiceProtocol {
    
    func fetch(_ router: String, id: String = "") -> AnyPublisher<DataResponse<SortData, NetworkError>, Never> {
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache?.removeAllCachedResponses()
        configuration.urlCache = nil
        
        let url = URL(string: self.SERVER+router+"/\(id)")!
        return AF.request(url,
                          method: .get)
            .validate()
            .publishDecodable(type: SortData.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
