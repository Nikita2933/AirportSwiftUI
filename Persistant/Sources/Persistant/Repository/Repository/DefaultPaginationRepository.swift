//
//  DefaultPaginationRepository.swift
//  
//
//  Created by Никита Иванов on 07.07.2022.
//

import Domain

public final class DefaultPaginationRepository: PaginationRepository {
    let apiPagination: ApiPagination
    
    public init(apiPagination: ApiPagination) {
        self.apiPagination = apiPagination
    }
    
    public func getListPagination(offset: Int, limit: Int) async throws -> [PaginationItemModel] {
        let paginationModel = try await apiPagination.getListPagination(offset: offset, limit: limit)
        
        return paginationModel.embedded.items.map { $0.toDomain() }
    }
}
