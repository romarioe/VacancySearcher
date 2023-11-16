//
//  VacancyData.swift
//  HHSearcher
//
//  Created by Roman Efimov on 12.11.2023.
//

import Foundation

struct VacancyData: Decodable {
    let items: [Vacancy]?
    
    static var placeholder: Self {
        return VacancyData(items: nil)
    }
}
