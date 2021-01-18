//
//  ViewController.swift
//  Filmes-MVVM
//
//  Created by Leticia Sousa Siqueira on 14/01/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    var dataViewModel = DataViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    func initViewModel() {
        dataViewModel.reloadTableView = {
            DispatchQueue.main.async { self.tableView?.reloadData() }
        }
        dataViewModel.showError = {
            DispatchQueue.main.async { self.showAlert("Algo deu errado!") }
        }
        dataViewModel.showLoading = {
            DispatchQueue.main.async { self.activityIndicator?.startAnimating() }
        }
        dataViewModel.hideLoading = {
            DispatchQueue.main.async { self.activityIndicator?.stopAnimating() }
        }
        dataViewModel.getData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell",
                                                       for: indexPath) as? CustomTableViewCell else {
            fatalError("A célula não existe!")
        }
        let cellVM = dataViewModel.getCellViewModel( at: indexPath )
        cell.lblTitle.text = cellVM.titleText
        cell.lblSubTitle.text = cellVM.subTitleText
        return cell
    }
}
