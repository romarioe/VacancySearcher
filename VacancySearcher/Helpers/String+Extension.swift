//
//  String+Extension.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 15.11.2023.
//

import Foundation


extension String {
    
    
    public var withoutHtml: String {
            guard let data = self.data(using: .utf8) else {
                return self
            }

            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]

            guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
                return self
            }

            return attributedString.string
        }
    
    
}
