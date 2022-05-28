//
//  DefaultApiAirport.swift
//  
//
//  Created by Никита Иванов on 14.05.2022.
//

import Foundation
import Domain
import Alamofire

public final class DefaultApiAirport: ApiArrival, ApiDeparture {
    public init() { }
    
    public func getListArrival(args: GetAirportListArgs) async throws -> Data {
        try await withUnsafeThrowingContinuation { continuation in
            let parameterDictionary = [
                "date" : args.times.time,
                "type" : "arrival",
                "fully_sorted" : "1"
            ]

            let header: HTTPHeaders = .init([.accept("text/html; charset=utf-8")])

            AF.request(
                ApiAirportConfiguration.shared.flightPath,
                method: .get,
                parameters: parameterDictionary,
                encoder: URLEncodedFormParameterEncoder.default,
                headers: header,
                interceptor: nil,
                requestModifier: .none
            ).responseData { response in

                if let data = response.data {
                    continuation.resume(returning: data)
                    return
                }
                if let error = response.error {
                    continuation.resume(throwing: error)
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }

    public func getListDeparture(args: GetAirportListArgs) async throws -> Data {
        try await withUnsafeThrowingContinuation { continuation in
            let parameterDictionary = [
                "date" : args.times.time,
                "type" : "departure",
                "fully_sorted" : "1"
            ]

            let header: HTTPHeaders = .init([.accept("text/html; charset=utf-8")])

            AF.request(
                ApiAirportConfiguration.shared.flightPath,
                method: .get,
                parameters: parameterDictionary,
                encoder: URLEncodedFormParameterEncoder.default,
                headers: header,
                interceptor: nil,
                requestModifier: .none
            ).responseData { response in

                if let data = response.data {
                    continuation.resume(returning: data)
                    return
                }
                if let error = response.error {
                    continuation.resume(throwing: error)
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }
}
