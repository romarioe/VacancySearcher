//
//  VacanciesView.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 13.11.2023.
//

import UIKit
import SnapKit

final class VacanciesView: UIView {
    
     var searchTextField = TextFieldWithPadding()
     var vacancyTableView = UITableView()
    
    var emptyLabel: UILabel = {
        let emptyLabel = UILabel()
        emptyLabel.numberOfLines = 2
        emptyLabel.font = UIFont.boldSystemFont(ofSize: 15)
        emptyLabel.textColor = #colorLiteral(red: 0.2437186241, green: 0.2855442762, blue: 0.3450374305, alpha: 1)
        emptyLabel.text = "Введите в поиск название (минимум 3 буквы) и появится список вакансий "
        return emptyLabel
    } ()
    
    
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setUpConstraints()
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        let subviews = [searchTextField, vacancyTableView, emptyLabel]// activityIndicationView]
        
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    
    
    private func setUpConstraints() {
        
        searchTextField.layer.borderWidth = 0.3
        searchTextField.layer.borderColor = CGColor(gray: 0.5, alpha: 0.5)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        emptyLabel.snp.makeConstraints{make in
            make.top.equalTo(searchTextField).inset(80)
            make.trailing.leading.equalToSuperview().inset(10)
        }
        
        vacancyTableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField).inset(80)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    
    private func setUpViews() {
        searchTextField.layer.cornerRadius = 10
        searchTextField.autocorrectionType = .no
        searchTextField.backgroundColor = .white
        searchTextField.placeholder = "Поиск..."
    }
    
    
    
}



class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 10,
        bottom: 0,
        right: 10
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
