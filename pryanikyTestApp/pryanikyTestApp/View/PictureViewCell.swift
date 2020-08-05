//
//  PictureViewCell.swift
//  pryanikyTestApp
//
//  Created by Georgij Malygin on 29/07/2020.
//  Copyright © 2020 Georgij Malygin. All rights reserved.
//

import UIKit

class PictureViewCell: UITableViewCell {
    
    private lazy var view: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var picture: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    func configure(data: [GeneralData]) {
        for elem in data {
            if elem.name == "picture" {
                guard let text = elem.data?.text, let url = URL(string: elem.data?.url ?? "")  else {
                    return
                }
                guard let data = try? Data(contentsOf: url) else{
                    return
                }
                let image = UIImage(data: data)
                label.text = text
                picture.image = image
            }
        }
    }
    func setupView() {
        addSubview(view)
        view.addArrangedSubview(label)
        view.addArrangedSubview(picture)
        setupConstr()
    }
    
    func setupConstr() {
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.heightAnchor.constraint(equalTo: heightAnchor),
            picture.widthAnchor.constraint(equalToConstant: 150),
            picture.heightAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "PictureViewCell")
        setupView()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
