//
//  NetworkError.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 22/05/23.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
