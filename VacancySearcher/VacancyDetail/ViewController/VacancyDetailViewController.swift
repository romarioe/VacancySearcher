//
//  VacancyDetailViewController.swift
//  VacancySearcher
//
//  Created by Roman Efimov on 15.11.2023.
//

import UIKit
import Combine

class VacancyDetailViewController: UIViewController {

    private var cancellable = Set<AnyCancellable>()
    
    private let viewModel = VacancyDetailViewModel()
    private var vacancyDetail: VacancyDetailModel?
    
    @Published var vacancyId: String = ""
    
    private var vacancyDetailTableView = UITableView()
    private let salaryHelper = SalaryHelper()
    private let addressHelper = AddressHelper()
    
    
    func setupUI(){
        
        view.backgroundColor = .white
        
        view.addSubview(vacancyDetailTableView)
        vacancyDetailTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        vacancyDetailTableView.separatorStyle = .none
        
    }
    
    
    
    func cellsRegister(){
        vacancyDetailTableView.register(VacancyNameTableViewCell.self, forCellReuseIdentifier: "nameCell")
        vacancyDetailTableView.register(VacancySalaryTableViewCell.self, forCellReuseIdentifier: "salaryCell")
        vacancyDetailTableView.register(VacancyAddressTableViewCell.self, forCellReuseIdentifier: "addressCell")
        vacancyDetailTableView.register(VacancyDescriptionTableViewCell.self, forCellReuseIdentifier: "descriptionCell")
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
        cellsRegister()
        
        vacancyDetailTableView.delegate = self
        vacancyDetailTableView.dataSource = self
        
        binding()

    }
    
    
    
    func binding() {
        
        $vacancyId
            .sink { [self] _ in
                viewModel.fetchVacancyDetail(with: self.vacancyId)
            }
            .store(in: &cancellable)

        
        viewModel.$vacancyDetail
           .sink(receiveValue: {[weak self] vacancyDetail in
                
               self?.vacancyDetail = vacancyDetail
               DispatchQueue.main.async {
                   self?.vacancyDetailTableView.reloadData()
               }
           }
        )
           .store(in: &cancellable)
    }
    
}





// MARK: - UITableViewDataSource, UITableViewDelegate

extension VacancyDetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case  0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as? VacancyNameTableViewCell  else {return UITableViewCell()}
            cell.nameLabel.text = vacancyDetail?.name
            cell.selectionStyle = .none
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "salaryCell", for: indexPath) as? VacancySalaryTableViewCell  else {return UITableViewCell()}
                        
            cell.salaryLabel.text = salaryHelper.getResultSalaryString(from: vacancyDetail?.salary?.salaryFrom, to: vacancyDetail?.salary?.salaryTo, currency: vacancyDetail?.salary?.currency)
            
            cell.selectionStyle = .none
            return cell
            
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as? VacancyAddressTableViewCell  else {return UITableViewCell()}
            
            cell.addressLabel.text = addressHelper.getAddressString(city: vacancyDetail?.address?.city,
                                                                    street: vacancyDetail?.address?.street,
                                                                    building: vacancyDetail?.address?.building,
                                                                    metroLine: vacancyDetail?.address?.metro?.lineName,
                                                                    metroStation: vacancyDetail?.address?.metro?.stationName)
            
            cell.selectionStyle = .none
            return cell
            
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as? VacancyDescriptionTableViewCell  else {return UITableViewCell()}
            guard let description = vacancyDetail?.description else {return cell}
            cell.descriptionText.text = description.withoutHtml
            cell.selectionStyle = .none
            return cell
            
            
        }
        
    }
    
    

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch indexPath.row {
        case 0: return 85
        case 1:
            if vacancyDetail?.salary != nil {
                return 50
            } else {
                return 0
            }
           
        case 2:
            if vacancyDetail?.address != nil {
                if vacancyDetail?.address?.metro != nil {
                    return 90
                } else {
                    return 60
                }
                
            } else {
                return 0
            }
        case 3:
            if vacancyDetail?.description != nil {
                return 1500
            } else {
                return 0
            }
            
        default: return 60
        }
    }
    
    
}
    

