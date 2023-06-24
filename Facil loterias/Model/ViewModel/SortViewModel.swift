//
//  SortViewModel.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 22/05/23.
//

import Foundation
import Combine
import Alamofire

class SortViewModel: ObservableObject {
    
    
    // MARK: - Published

    @Published var sortData: SortData?
    @Published var error: String = ""
    @Published var isError: Bool = false
    @Published var isLoad: Bool = false
    var onCompletion: ((_ sortData: SortData) -> Void)?

    // MARK: - Properties

    private var cancellableSet: Set<AnyCancellable> = []
    private var dataManager: ServiceProtocol
    
    init(dataManager: ServiceProtocol = Service.shared) {
        self.dataManager = dataManager
    }
}


// MARK: - Get model

extension SortViewModel {
    
    func get(_ router: String, id: String = "" ,onCompletion: @escaping (_ sortData: SortData) -> Void) {
        self.isError = false
        self.isLoad = true
        self.onCompletion = onCompletion
        self.dataManager.fetch(router, id: id)
            .sink { response in
                self.didComplete(response: response)
            }.store(in: &cancellableSet)
    }
    
    private func didComplete(response: DataResponse<SortData, NetworkError>) {
        self.isLoad = false
        if response.error != nil {
            self.didFail("Veja sua sua conexão e tente novamente em instantes. ;)")
        } else {
            self.didSuccess(response.value)
        }
    }
    
    private func didSuccess(_ sortData: SortData?) {
        guard let sortData = sortData, let onCompletion = onCompletion else {
            self.didFail("Estamos melhorando nossos serviços tente novamente em instantes. ;)")
            return
        }
        
        self.sortData = sortData
        onCompletion(sortData)
    }
    
    private func didFail(_ error: String) {
        self.error = error
        self.isError = true
    }
}
