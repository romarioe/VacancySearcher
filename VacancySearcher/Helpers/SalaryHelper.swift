//
//  SalaryHelper.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 16.11.2023.
//

import Foundation

class SalaryHelper {
    
    
    func getResultSalaryString(from: Int?, to: Int?, currency: String?) -> String {
    
        var salaryFrom = ""
        var salaryTo = ""
        var returnValue = ""
        
        if let from = from {
            salaryFrom = "От  " + String(from)
        }
        
        
        if let to = to {
            salaryTo = "До  " + String(to)
        }
        
        if salaryFrom != "" || salaryTo != "" {
            returnValue = salaryFrom  + " " + salaryTo + " " + (currency ?? "")
        }
    
        return returnValue
        
    }
    
    
    
}
