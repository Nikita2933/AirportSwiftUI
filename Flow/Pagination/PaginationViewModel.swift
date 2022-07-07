//
//  PaginationViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.07.2022.
//

import Foundation
import Domain
import CoreAirport


final class PaginationViewModel: ObservableObject {
    private var paginationRepository: PaginationRepository
    var loadManager: PaginationLoadManager
    @Published public var exampleList: [PaginationItemModel] = []
    
    init(paginationRepository: PaginationRepository, loadManager: PaginationLoadManager) {
        self.paginationRepository = paginationRepository
        self.loadManager = loadManager
    }
    
    @MainActor func loadPage() async {
        do {
            let loadedList = try await paginationRepository.getListPagination(
                offset: loadManager.offset,
                limit: loadManager.limit
            )
            loadManager.incrementPage()
            loadManager.updateNextPage(hasNextPage: loadedList.count == loadManager.limit)
            
            exampleList.append(contentsOf: loadedList)
            
        } catch let error {
            await MessageObserver.shared.handleError(error)
        }
    }
    
    @MainActor
    func reloadScreen() async {
        exampleList = []
        loadManager.resetPage()
        await loadPage()
    }
}
