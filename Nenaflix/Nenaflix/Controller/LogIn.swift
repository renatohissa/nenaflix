//
//  LogIn.swift
//  Nenaflix
//
//  Created by Renato Pinheiro Hissa on 02/09/23.
//

import UIKit

class LogIn: UIViewController {
    
        private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
//        let backGroundImage = UIImageView(image: UIImage(named: "LaunchScreen"))
//        backGroundImage.frame = view.bounds
//        backGroundImage.contentMode  = .scaleAspectFill
//        view.addSubview(backGroundImage)
//        view.sendSubviewToBack(backGroundImage)
        view.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.center = view.center
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//    }
    
    @objc func didTapButton() {
         
         let tabBarVC = UITabBarController()

         let vc1 = UINavigationController(rootViewController: ViewController())
         let vc2 = UINavigationController(rootViewController: MovieDetailViewController())
         let vc3 = UINavigationController(rootViewController: FavoriteMovieViewController())

         vc1.title = "Filmes"
         vc2.title = "Favoritos"
         vc3.title = "Mensagem"

         vc1.tabBarItem = UITabBarItem(title: vc1.title, image: UIImage(systemName: "house"), tag: 0)
         vc2.tabBarItem = UITabBarItem(title: vc2.title, image: UIImage(systemName: "star"), tag: 1)
         vc3.tabBarItem = UITabBarItem(title: vc3.title, image: UIImage(systemName: "message"), tag: 2)

         tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
         
         vc1.tabBarItem.badgeValue = "1"
         vc2.tabBarItem.badgeValue = "1"
         vc3.tabBarItem.badgeValue = "1"

         tabBarVC.modalPresentationStyle = .fullScreen
         present(tabBarVC, animated: true)
        
     }
    
}
