//
//  AddressHelper.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 16.11.2023.
//

import Foundation



class AddressHelper {
    
    func getAddressString(city: String?, street: String?, building: String?, metroLine: String?, metroStation: String?) -> String {
        
        var address = ""
        var metro = ""
       
        
        if let city = city {
            address = "Адрес: " + city
            
        }
        
        if let street = street {
           address = address + ", " + street
        }
        
        
        if let building = building {
            address = address + ", " +  building
        }
        
        if (metroLine != nil) && (metroStation != nil) && (address != "") {
            address = address + "\n"
            
        }
        
        if let lineName = metroLine {
            metro = "Метро: линия " + lineName
        }
        
        if let stationName = metroStation {
            metro = metro + ", станция " +  stationName
        }
        
        return address + metro
        
    }
    
    
    
}
