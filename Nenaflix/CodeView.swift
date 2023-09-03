//
//  ViewCode.swift
//  Nenaflix
//
//  Created by Renato Pinheiro Hissa on 14/08/23.
//

import Foundation

public protocol CodeView {
    func setupHierarchy()
    func setupConstraints()
    func setupAdditionalConfigurations()
}

extension CodeView {
    public func setupView() {
        setupHierarchy()
        setupConstraints()
        setupAdditionalConfigurations()
    }
    
    public func setupAdditionalConfigurations() { }
}
