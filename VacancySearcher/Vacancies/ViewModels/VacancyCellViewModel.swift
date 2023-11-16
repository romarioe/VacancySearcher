//
//  VacancyCellViewModel.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 14.11.2023.
//

import Foundation
import Combine

final class VacancyCellViewModel {
    @Published var name: String = ""
    @Published var employerName: String = ""
    @Published var salaryFrom: Int?
    @Published var salaryTo: Int?
    @Published var currency: String = ""
    @Published var requirement: String = ""
    @Published var responsibility: String = ""
    @Published var logoUrl: String = ""
        
    private let vacancy: Vacancy
    
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
        setUpBindings()
    }
    
    
    private func setUpBindings() {
        name = vacancy.name
        employerName = vacancy.employer.name
        salaryFrom = vacancy.salary?.salaryFrom
        salaryTo = vacancy.salary?.salaryTo
        currency = vacancy.salary?.currency ?? ""
        requirement = vacancy.snippet.requirement?.withoutHtml ?? ""
        responsibility = vacancy.snippet.responsibility?.withoutHtml ?? ""
        logoUrl = vacancy.employer.logoUrls?.original ?? ""
    }
    
    
    
}

