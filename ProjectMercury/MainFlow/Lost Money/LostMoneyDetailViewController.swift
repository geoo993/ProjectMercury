//
//  LostMoneyDetailViewController.swift
//  ProjectMercury
//
//  Created by GEORGE QUENTIN on 02/01/2021.
//

import UIKit

class LostMoneyDetailViewController: UIViewController {

    weak var router: NavigationRoutable?
    
    // MARK: - Initializer
    
    init(router: NavigationRoutable) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        self.title = "Lost Money Detail"
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        // Pockets button
        let pocketsButton = UIButton(type: .roundedRect)
        pocketsButton.backgroundColor = .black
        pocketsButton.setTitle("Pockets", for: .normal)
        pocketsButton.setTitleColor(UIColor.white, for: .normal)
        pocketsButton.addTarget(self, action: #selector(self.pocketsButtonTapped), for: .touchUpInside)
        self.view.addSubview(pocketsButton)
        pocketsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pocketsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pocketsButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            pocketsButton.widthAnchor.constraint(equalToConstant: 150),
            pocketsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    
    @objc func pocketsButtonTapped(_ sender: UIButton) {
        router?.route(to: RouteData(path: .pockets), animated: true, completion: nil)
    }

}
