//
//  MainViewController.swift
//  UiKit_MVVM_Xib
//
//  Created by Devin Maleke on 23/01/24.
//

import UIKit

class MainViewController: UIViewController {

    
    //IBoutlets:
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //Variables:
    var cellDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        bindViewModel()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else{
                return()
            }
            
            DispatchQueue.main.async{
                if isLoading{
                    self.activityIndicator.startAnimating()
                } else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            
            self.cellDataSource = movies
            self.reloadTableView()
            
        }
    }
    
    func openDetail(movieId: Int) {
        guard let movie = viewModel.getMovieById(with: movieId) else {
            return
        }
        
        let detailViewModel = DetailMovieViewModel(movie: movie)
        let detailController = DetailMovieViewController (viewModel: detailViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailController, animated: true)
        }
        
    }
    


}
