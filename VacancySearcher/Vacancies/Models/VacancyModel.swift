//
//  VacancyModel.swift
//  HHSearcher
//
//  Created by Roman Efimov on 12.11.2023.
//

import Foundation

struct Vacancy: Decodable {
    let id: String
    let name: String
    let salary: Salary?
    let snippet: Snippet
    let employer: Employer
}



struct Salary: Decodable {
    let salaryFrom: Int?
    let salaryTo: Int?
    let currency: String?
}


struct Snippet: Decodable{
    let requirement: String?
    let responsibility: String?
}



struct Employer: Decodable{
    let name: String
    let logoUrls: LogoUrls?
}


struct LogoUrls: Decodable{
    let original: String?
}




extension Employer {
    enum CodingKeys: String, CodingKey {
        case name
        case logo_urls

    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        logoUrls = try container.decodeIfPresent(LogoUrls.self, forKey: .logo_urls)

    }
}




extension Salary {
    enum CodingKeys: String, CodingKey {
        case from
        case to
        case currency

    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        salaryFrom = try container.decodeIfPresent(Int.self, forKey: .from)
        salaryTo = try container.decodeIfPresent(Int.self, forKey: .to)
        currency = try container.decodeIfPresent(String.self, forKey: .currency)

    }
}

