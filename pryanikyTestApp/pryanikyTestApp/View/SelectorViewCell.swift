//
//  SelectorViewCell.swift
//  pryanikyTestApp
//
//  Created by Georgij Malygin on 29/07/2020.
//  Copyright © 2020 Georgij Malygin. All rights reserved.
//

import UIKit

class SelectorViewCell: UITableViewCell {
    
    var actionHandler: ((_ index: Int) -> Void)? = nil

    private lazy var view: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segment: UISegmentedControl = {
        let segment = UISegmentedControl()
        return segment
    }()
    
    func setupSegmentedControl(items: [VariantsSelectors], selectedIndex: Int) {
        segment.removeAllSegments()
        for variant in items {
            guard let text = variant.text, let id = variant.id else { return }
            segment.insertSegment(withTitle: text, at: id, animated: true)
        }
        segment.selectedSegmentIndex = selectedIndex
        segment.addTarget(self, action: #selector(selId(_:)), for: .allEvents)
    }
    
    func configure(data: [GeneralData]) {
        for elem in data {
            if elem.name == "selector" {
                guard let variants = elem.data?.variants, let selectedId = elem.data?.selectedId else { return }
                setupSegmentedControl(items: variants, selectedIndex: selectedId)
                break
            }
        }
    }
    
    func setupView() {
        addSubview(view)
        view.addArrangedSubview(segment)
        setupConstr()
    }
    
    func setupConstr() {
    NSLayoutConstraint.activate([
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
        view.centerYAnchor.constraint(equalTo: centerYAnchor),
        view.heightAnchor.constraint(equalTo: heightAnchor),
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
    ])
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SelectorViewCell")
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func selId(_ sender: UISegmentedControl) {
        actionHandler?(sender.selectedSegmentIndex)
    }
}
