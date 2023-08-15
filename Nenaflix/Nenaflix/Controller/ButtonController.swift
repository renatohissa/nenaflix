////
////  ButtonController.swift
////  Nenaflix
////
////  Created by Renato Pinheiro Hissa on 15/08/23.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    private var button1: UIButton!
//    private var button2: UIButton!
//    private var button3: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupButtons()
//        fetchMovieData()
//    }
//
//    func setupButtons() {
//        button1 = createButton(title: "Meus Filmes", tag: 1, x: -30, y: 20)
//        button2 = createButton(title: "Meus Favoritos", tag: 2, x: 90, y: 20)
//        button3 = createButton(title: "Lançamentos", tag: 3, x: 220, y: 20)
//
//        // Outros botões...
//    }
//
//    func createButton(title: String, tag: Int, x: CGFloat, y: CGFloat) -> UIButton {
//        let button = UIButton(type: .system)
//        button.setTitle(title, for: .normal)
//        button.tag = tag
//        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(button)
//
//        NSLayoutConstraint.activate([
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: x),
//            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -y),
//            button.widthAnchor.constraint(equalToConstant: 200),
//            button.heightAnchor.constraint(equalToConstant: 40)
//        ])
//
//        return button
//    }
//
//    @objc func buttonTapped(_ sender: UIButton) {
//        switch sender.tag {
//        case 1:
//            print("Reproduzindo Harry Potter")
//        case 2:
//            print("Efeito Borboleta")
//        case 3:
//            print("O Senhor dos Anéis")
//        default:
//            break
//        }
//    }
//}
//// ... Seções anteriores do seu código ...
