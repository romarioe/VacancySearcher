//
//  VacancyDetailModels.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 15.11.2023.
//

import Foundation

struct VacancyDetailModel: Decodable {
    let name: String?
    let salary: Salary?
    let address: Address?
    let description: String?
    
    
    static var placeholder: Self {
        return  VacancyDetailModel(name: nil,
                                    salary: nil,
                                    address: nil,
                                    description: nil
        )

    }
}




struct Address: Decodable{
    let city: String?
    let street: String?
    let building: String?
    let metro: Metro?
}


struct Metro: Decodable{
    let stationName: String?
    let lineName: String?
    

}



extension Metro {
    enum CodingKeys: String, CodingKey {
        case station_name
        case line_name
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        stationName = try container.decodeIfPresent(String.self, forKey: .station_name)
        lineName = try container.decodeIfPresent(String.self, forKey: .line_name)
        
    }
}

