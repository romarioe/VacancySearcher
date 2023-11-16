//
//  NetworkService.swift
//  HHSearcher
//
//  Created by Roman Efimov on 12.11.2023.
//

import Foundation
import Combine
import UIKit


class NetworkService{
    

    private let baseaseURL = "https://api.hh.ru"
    
    private func vacanciesURL(searchText: String, page: Int) -> URL? {
        let queryURL = URL(string: baseaseURL)!
        
        let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        guard var urlComponents = components else { return nil}
        urlComponents.path = "/vacancies"
        urlComponents.queryItems = [URLQueryItem(name: "text", value: searchText),
                                    URLQueryItem(name: "page", value: String(page))]
        return urlComponents.url
    }
    
    
    
    
    
    private func vacancyDetailURL(id: String) -> URL? {
        let queryURL = URL(string: baseaseURL)!
        
        let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        guard var urlComponents = components else { return nil}
        urlComponents.path = "/vacancies/" + id
    
        return urlComponents.url
    }
    
    
    
    

    func fetchVacancies(for searchText: String, page: Int) -> AnyPublisher<VacancyData, Never> {
    
               guard let url = vacanciesURL(searchText: searchText, page: page) else {
                   return Just(VacancyData.placeholder)
                       .eraseToAnyPublisher()
               }
               return
               URLSession.shared.dataTaskPublisher(for:url)
                   .map { $0.data }
                   .decode(type: VacancyData.self, decoder: JSONDecoder())
                   .catch { error in Just(VacancyData.placeholder)}
                   .receive(on: RunLoop.main)
                   .eraseToAnyPublisher()
       }
    
    
    
    
    
    
    func fetchVacancyDetail(for id: String) -> AnyPublisher<VacancyDetailModel, Never> {
    
               guard let url = vacancyDetailURL(id: id) else {
                   return Just(VacancyDetailModel.placeholder)
                       .eraseToAnyPublisher()
               }
               return
               URLSession.shared.dataTaskPublisher(for:url)
                   .map { $0.data }
                   .decode(type: VacancyDetailModel.self, decoder: JSONDecoder())
                   .catch { error in Just(VacancyDetailModel.placeholder)}
                   .receive(on: RunLoop.main)
                   .eraseToAnyPublisher()
       }  
    
    
    
    
}




