//
//  VacancyNameTableViewCell.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 15.11.2023.
//

import UIKit

class VacancyNameTableViewCell: UITableViewCell {
    
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 3
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.textColor = #colorLiteral(red: 0.2437186241, green: 0.2855442762, blue: 0.3450374305, alpha: 1)
        return nameLabel
    } ()
    
    
    
    func setupUI(){

        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(10)
        
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
