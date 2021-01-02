//
//  LostMoneyViewController.swift
//  ProjectMercury
//
//  Created by GEORGE QUENTIN on 13/12/2020.
//

import UIKit

class LostMoneyViewController: UIViewController {

    weak var router: NavigationRoutable?
    
    // MARK: - Initializer
    
    init(router: NavigationRoutable) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        // Lost money detail button
        let detailButton = UIButton(type: .roundedRect)
        detailButton.backgroundColor = .black
        detailButton.setTitle("Lost Money Detail", for: .normal)
        detailButton.setTitleColor(UIColor.white, for: .normal)
        detailButton.addTarget(self, action: #selector(self.lostMoneyDetailButtonTapped), for: .touchUpInside)
        self.view.addSubview(detailButton)
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            detailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            detailButton.widthAnchor.constraint(equalToConstant: 150),
            detailButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Invite button
        let inviteButton = UIButton(type: .roundedRect)
        inviteButton.backgroundColor = .black
        inviteButton.setTitle("Invite", for: .normal)
        inviteButton.setTitleColor(UIColor.white, for: .normal)
        inviteButton.addTarget(self, action: #selector(self.inviteButtonTapped), for: .touchUpInside)
        self.view.addSubview(inviteButton)
        inviteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inviteButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            inviteButton.topAnchor.constraint(equalTo: detailButton.bottomAnchor, constant: 20),
            inviteButton.widthAnchor.constraint(equalToConstant: 100),
            inviteButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - UI Setup
    
    private func setupTabBarItem() {
        title = "Lost Money"
        tabBarItem.image = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        tabBarItem.selectedImage = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysOriginal)
    }
    
    // MARK: - Actions
    
    @objc func lostMoneyDetailButtonTapped(_ sender: UIButton) {
        router?.route(to: RouteData(path: .lostMoneyDetail), animated: true, completion: nil)
    }
    
    @objc func inviteButtonTapped(_ sender: UIButton) {
        router?.route(to: RouteData(path: .inviteFriends), animated: true, completion: nil)
    }
}
