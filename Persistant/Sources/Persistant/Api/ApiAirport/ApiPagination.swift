//
//  ApiPagination.swift
//  
//
//  Created by Никита Иванов on 07.07.2022.
//

import Domain

public protocol ApiPagination: AnyObject {
    func getListPagination(offset: Int, limit: Int) async throws -> ApiPaginationModel
}
