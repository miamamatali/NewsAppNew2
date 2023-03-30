//
//  ViewController.swift
//  NewsAppNew2
//
//  Created by Indira on 30/3/23.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    private var timeData: [Article] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        
        APIManager.shared.getData { [weak self] result in
                    switch result {
                    case .success(let data):
                        print(data.articles.count)
                        DispatchQueue.main.async {
                            guard let `self` = `self` else {return}
                            self.timeData = data.articles
                            self.tableView.reloadData()
                    }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
    }

    func setupTableView() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func setupConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
                    fatalError("error")
                }
                cell.configure(with: timeData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SecondViewController()
        vc.configure(with: timeData[indexPath.row])
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
