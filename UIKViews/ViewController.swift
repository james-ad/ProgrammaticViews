//
//  ViewController.swift
//  UIKViews
//
//  Created by James Dunn on 2/28/23.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupButton()
    }
    
    func setupButton() {
        view.addSubview(button)
        
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemMint
        button.configuration?.title = "Hello, World"
        button.addTarget(self, action: #selector(setupTable), for: .touchDown)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    func setupTable() {
        button.isHidden = true
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemMint
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 6
        
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalToConstant: 200),
            tableView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        tableCell.backgroundColor = .systemMint
        tableCell.layer.borderColor = UIColor.black.cgColor
        tableCell.layer.borderWidth = 0.5
        tableCell.layer.cornerRadius = 5
        
        var config = UIListContentConfiguration.cell()
        config.text = "Cell # \(indexPath[1])"
        config.textProperties.color = .white
        
        tableCell.contentConfiguration = config
        
        return tableCell
    }
}
