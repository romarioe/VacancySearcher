//
//  VacancyDescriptionTableViewCell.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 15.11.2023.
//

import UIKit

class VacancyDescriptionTableViewCell: UITableViewCell {

    
    
    class VerticalTopAlignLabel: UILabel {

        override func drawText(in rect:CGRect) {
            guard let labelText = text else {  return super.drawText(in: rect) }

            let attributedText = NSAttributedString(string: labelText, attributes: [NSAttributedString.Key.font: font])
            var newRect = rect
            newRect.size.height = attributedText.boundingRect(with: rect.size, options: .usesLineFragmentOrigin, context: nil).size.height

            if numberOfLines != 0 {
                newRect.size.height = min(newRect.size.height, CGFloat(numberOfLines) * font.lineHeight)
            }

            super.drawText(in: newRect)
        }

    }
    
    
    var descriptionText = VerticalTopAlignLabel()
    
    
    func setupUI(){
        
        contentView.addSubview(descriptionText)
        descriptionText.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        descriptionText.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        descriptionText.numberOfLines = 0
        descriptionText.font = UIFont.systemFont(ofSize: 15)
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

 
}
