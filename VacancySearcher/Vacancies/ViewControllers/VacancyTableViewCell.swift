//
//  VacancyTableViewCell.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 13.11.2023.
//

import UIKit
import SDWebImage

class VacancyTableViewCell: UITableViewCell {
    
    
    var salaryHelper = SalaryHelper()
    
    
    var viewModel: VacancyCellViewModel! {
        didSet { setUpViewModel() }
    }
    
    
    var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.layer.cornerRadius = 15
        logoImage.contentMode = .scaleAspectFit
        return logoImage
    }()
    
    
    var numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.numberOfLines = 1
        numberLabel.font = UIFont.systemFont(ofSize: 13)
        numberLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return numberLabel
    } ()
    
    
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.textColor = #colorLiteral(red: 0.2437186241, green: 0.2855442762, blue: 0.3450374305, alpha: 1)
        return nameLabel
    } ()
    
    
    
    var salaryLabel: UILabel = {
        let salaryLabel = UILabel()
        salaryLabel.numberOfLines = 1
        salaryLabel.font = UIFont.systemFont(ofSize: 16)
        salaryLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return salaryLabel
    } ()
    
    
    
    var employerNameLabel: UILabel = {
        let employerNameLabel = UILabel()
        employerNameLabel.numberOfLines = 1
        employerNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        employerNameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return employerNameLabel
    } ()
    
    
    var requirementLabel: UILabel = {
        let requirementLabel = UILabel()
        requirementLabel.numberOfLines = 2
        requirementLabel.font = UIFont.systemFont(ofSize: 15)
        requirementLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return requirementLabel
    } ()
    
    
    
    var responsibilityLabel: UILabel = {
        let responsibilityLabel = UILabel()
        responsibilityLabel.numberOfLines = 2
        responsibilityLabel.font = UIFont.systemFont(ofSize: 15)
        responsibilityLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return responsibilityLabel
    } ()

    
    
    func setupUI(){
        
        contentView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(250)
        }
        
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(250)
        }
        
        
        contentView.addSubview(logoImage)
        self.logoImage.layer.masksToBounds = true
        logoImage.snp.makeConstraints{ make in
            make.top.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.width.height.equalTo(100)
        }
        
        
        contentView.addSubview(employerNameLabel)
        employerNameLabel.snp.makeConstraints{make in
            make.top.equalTo(nameLabel).inset(50)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(250)
            
        }
        
        
        contentView.addSubview(salaryLabel)
        salaryLabel.snp.makeConstraints{make in
            make.top.equalTo(employerNameLabel).inset(30)
            make.leading.trailing.equalToSuperview().inset(10)
            
        }
        
        contentView.addSubview(requirementLabel)
        requirementLabel.snp.makeConstraints{make in
            make.top.equalTo(salaryLabel).inset(30)
            make.leading.trailing.equalToSuperview().inset(10)
            
        }
        
        contentView.addSubview(responsibilityLabel)
        responsibilityLabel.snp.makeConstraints{make in
            make.top.equalTo(requirementLabel).inset(50)
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
    
    
    
    
    private func setUpViewModel() {
        nameLabel.text = viewModel.name
        
        salaryLabel.text = salaryHelper.getResultSalaryString(from: viewModel.salaryFrom, to: viewModel.salaryTo, currency: viewModel.currency)
       
        employerNameLabel.text = viewModel.employerName
        requirementLabel.text = viewModel.requirement
        responsibilityLabel.text = viewModel.responsibility
        
        guard let logoURL = URL(string: viewModel.logoUrl) else {return}
        logoImage.sd_setImage(with: logoURL)
        
    }
    
    
}
