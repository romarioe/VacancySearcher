//
//  VacanciesViewModel.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 13.11.2023.
//

import Foundation
import Combine


final class VacanciesViewModel: ObservableObject {
    
    // input
    @Published var searchText: String = ""
    @Published var page: Int = 0
    @Published var dataLoad: Bool = false
    
    
    // output
    @Published var vacancies = VacancyData.placeholder
    
    var cancellableSet: Set<AnyCancellable> = []
    
    private let networkService =  NetworkService()
    
    
    func fetchData(with searchText: String, page: Int){
        
        let searchTermValueHandler: (VacancyData) -> Void = { [weak self] vacancies in
            self?.vacancies = vacancies
            self?.dataLoad = true
        }
    
        networkService
            .fetchVacancies(for: searchText, page: page)
            .sink(receiveValue: searchTermValueHandler)
            .store(in: &cancellableSet)
        
    }
    
    
    
    func search(query: String, page: Int) {   
        if query.count > 2 {
            fetchData(with: query, page: page)
        } else {
            vacancies = VacancyData.placeholder
            self.dataLoad = false
        }
       
    }
    
    
    
    
    func searchToPage(query: String, page: Int) {
        if page != 0 {
            if query.count > 2 {
                fetchData(with: query, page: page)
            } else {
                vacancies = VacancyData.placeholder
                self.dataLoad = false
            }
        }
    }
    
    
    
}


