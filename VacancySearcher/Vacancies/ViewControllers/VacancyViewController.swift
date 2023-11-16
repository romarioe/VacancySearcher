//
//  ViewController.swift
//  VacancyViewController
//
//  Created by Roman Efimov on 13.11.2023.
//

import UIKit
import Combine

class VacancyViewController: UIViewController {
    
    private var contentView = VacanciesView()
    
    private var cancellable = Set<AnyCancellable>()
    
    private let viewModel = VacanciesViewModel()
    private var vacancies: [Vacancy] = []

    @Published var page: Int = 0
    
    private var searchText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Вакансии"
        view.backgroundColor = .white
        contentView.vacancyTableView.delegate = self
        contentView.vacancyTableView.dataSource = self
        contentView.vacancyTableView.register(VacancyTableViewCell.self, forCellReuseIdentifier: "cell")
        
        binding()

    }
    
    
    override func loadView() {
        view = contentView
    }
    
    
    func bindViewToViewModel() {
        
        contentView.searchTextField.textPublisher
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak viewModel] in
                viewModel?.search(query: $0, page: self.page)
            }
            .store(in: &cancellable)
        
        
        $page
            .sink { [weak viewModel] in
                viewModel?.searchToPage(query: self.searchText, page: $0)
            }
            .store(in: &cancellable)
    
    }
    
    
    
    func binding() {
        
        bindViewToViewModel()
        
        viewModel.$dataLoad
            .receive(on: DispatchQueue.main)
            .assign(to: \.isHidden, on: contentView.emptyLabel)
            .store(in: &cancellable)
        
       
        viewModel.$vacancies
           .sink(receiveValue: {[weak self] vacancies in
            
               if let items = vacancies.items {
                   
                   if self?.searchText != self!.contentView.searchTextField.text {
                       self?.page = 0
                       self?.vacancies = items
                   } else {
                       self?.vacancies = (self?.vacancies ?? []) + items
                   }
                   DispatchQueue.main.async {
                       self!.contentView.vacancyTableView.reloadData()
                   }
               } else {
                   self?.vacancies = []
                   DispatchQueue.main.async {
                       self!.contentView.vacancyTableView.reloadData()
                   }
               }
           }
        )
           .store(in: &cancellable)
      
    }
    


}



// MARK: - UITableViewDataSource, UITableViewDelegate

extension VacancyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacancies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = contentView.vacancyTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VacancyTableViewCell
        
        cell.viewModel = VacancyCellViewModel(vacancy: vacancies[indexPath.row])
        cell.numberLabel.text = "# " + String(indexPath.row)
        
    
        return cell
    }
    

    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //Если до конца таблицы остается 5 ячеек, то увеличиваем счётчик страниц для пангинации
        
        if indexPath.row == vacancies.count-6 {
            self.searchText = contentView.searchTextField.text!
                page += 1
            }
        }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = VacancyDetailViewController()
        detailVC.vacancyId = vacancies[indexPath.row].id
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
