//
//  UITextField+Publisher.swift
//  CombineDemo
//
//  Created by Michal Cichecki on 03/07/2019.
//

import UIKit
import Combine

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map {$0.text ?? ""}
            .eraseToAnyPublisher()
    }
}
