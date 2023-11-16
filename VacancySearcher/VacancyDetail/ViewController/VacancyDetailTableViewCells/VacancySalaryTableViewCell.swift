//
//  VacancySalaryTableViewCell.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 15.11.2023.
//

import UIKit

class VacancySalaryTableViewCell: UITableViewCell {
    
    
    
    var salaryLabel: UILabel = {
        let salaryLabel = UILabel()
        salaryLabel.numberOfLines = 1
        salaryLabel.font = UIFont.boldSystemFont(ofSize: 18)
        salaryLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return salaryLabel
    } ()
    
    
    
    func setupUI(){
        
        contentView.addSubview(salaryLabel)
        salaryLabel.snp.makeConstraints{make in
            make.top.leading.trailing.equalToSuperview().inset(15)
            
        }
    }
        
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
