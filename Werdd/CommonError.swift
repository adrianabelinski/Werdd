//
//  CommonError.swift
//  Werdd
//
//  Created by Adriana Belinski on 11/20/22.
//

import Foundation

enum CommonError: LocalizedError {
    case genericError
    case invalidURL
    
    var errorDescription: String? {
        switch self {
        case .genericError:
            return "An error occured"
        case .invalidURL:
            return "Invalid url format"
        }
    }
}
