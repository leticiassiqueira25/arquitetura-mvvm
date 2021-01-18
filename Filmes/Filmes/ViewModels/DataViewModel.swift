//  DataViewModel.swift
//  Filmes-MVVM
//
//  Created by Leticia Sousa Siqueira on 14/01/21.
//

import UIKit

class DataViewModel {
    
    var filmes: [Filme] = [Filme]()
    var reloadTableView: (() -> Void)?
    var showError: (() -> Void)?
    var showLoading: (() -> Void)?
    var hideLoading: (() -> Void)?
    
    var viewData: Bindable<DataViewModel?> = Bindable(nil)
    
    private var cellViewModels: [DataListCellViewModel] = [DataListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func getData(){
        showLoading?()
        FilmeService().getDataFromServer { (success, filme) in
            self.hideLoading?()
            if success {
                self.createCell(filmes: filme!)
                self.reloadTableView?()
            } else {
                self.showError?()
            }
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> DataListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCell(filmes: [Filme]){
        self.filmes = filmes
        var vms = [DataListCellViewModel]()
        for data in filmes {
            vms.append(DataListCellViewModel(titleText: data.title, subTitleText: data.overview))
        }
        cellViewModels = vms
    }
}

struct DataListCellViewModel {
    let titleText: String
    let subTitleText: String
}
