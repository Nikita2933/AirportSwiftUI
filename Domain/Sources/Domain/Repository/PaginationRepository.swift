//
//  PaginationRepository.swift
//  
//
//  Created by Никита Иванов on 07.07.2022.
//

public protocol PaginationRepository {
    @MainActor func getListPagination(offset: Int, limit: Int) async throws -> [PaginationItemModel]
}
