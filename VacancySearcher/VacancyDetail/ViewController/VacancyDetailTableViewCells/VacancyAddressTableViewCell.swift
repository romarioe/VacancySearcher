//
//  VacancyAddressTableViewCell.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 15.11.2023.
//

import UIKit

class VacancyAddressTableViewCell: UITableViewCell {

    var addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.numberOfLines = 4
        addressLabel.font = UIFont.systemFont(ofSize: 16)
        addressLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return addressLabel
    } ()
    
    
    
    func setupUI(){
        
        contentView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints{make in
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
