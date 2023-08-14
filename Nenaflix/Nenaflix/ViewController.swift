//
//  ViewController.swift
//  Nenaflix
//
//  Created by Renato Pinheiro Hissa on 14/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var helloLabel: UILabel = {
            let label = UILabel()
            label.text = "Hello World"
            label.font = UIFont.systemFont(ofSize: 24)
            label.tintColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
extension ViewController: CodeView {
    func setupAdditionalConfigurations() {
        view.backgroundColor = .white
    }
    
    func setupHierarchy() {
        view.addSubview(helloLabel)
    }
    
    func setupConstraints() {
        helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}

