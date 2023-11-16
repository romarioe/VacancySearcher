//
//  VacancyDetailViewModel.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 15.11.2023.
//

import Foundation
import Combine


final class VacancyDetailViewModel: ObservableObject {
    
    
    var cancellableSet: Set<AnyCancellable> = []
    
    @Published var vacancyDetail = VacancyDetailModel.placeholder

    
    private let networkService =  NetworkService()
    
    
    func fetchVacancyDetail(with id: String){
        
        let searchTermValueHandler: (VacancyDetailModel) -> Void = { [weak self] vacancyDetail in
            self?.vacancyDetail = vacancyDetail
        }
    
        networkService
            .fetchVacancyDetail(for: id)
            .sink(receiveValue: searchTermValueHandler)
            .store(in: &cancellableSet)
        
    }
    
    
    
    
}
    




