//
//  ViewCellTableViewCell.swift
//  pryanikyTestApp
//
//  Created by Georgij Malygin on 27/07/2020.
//  Copyright © 2020 Georgij Malygin. All rights reserved.
//

import UIKit

class HzTableViewCell: UITableViewCell {
    private lazy var view: UIStackView = {
        let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    func configure(data: [GeneralData]) {
        for elem in data {
            if elem.name == "hz" {
                guard let text = elem.data?.text! else {
                    return
                }
                label.text = text
            }
        
        }
    }
    private func setupView() {
        addSubview(view)
        
        view.addArrangedSubview(label)
        
        setupConstrait()
    }
    private func setupConstrait() {
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            view.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
