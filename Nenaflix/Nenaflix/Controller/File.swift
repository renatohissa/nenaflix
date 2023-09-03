////
////  MovieDetailViewController.swift
////  Nenaflix
////
////  Created by Renato Pinheiro Hissa on 17/08/23.
////
//import UIKit
//
//class VideoListVC: UIViewController {
//    
//
//    let tableView = UITableView()
//    var videos: [Video] = []
//    
//    struct Cells {
//        static let videoCell = "VideoCell"
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Lista de Animes Favoritos"
//        videos = fetchData()
//        configureTableView()
//        
//    }
//    
//    func configureTableView() {
//        view.addSubview(tableView)
//        setTableViewDelegate()
//        tableView.rowHeight = 120
//        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
//        tableView.pin(to: view)
//        
//    }
//    
//    func setTableViewDelegate() {
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//}
//
//extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return videos.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
//        let video = videos[indexPath.row]
//        cell.set(video: video)
//        
//        return cell
//    }
//}
//
//extension VideoListVC {
//    
//    func fetchData() -> [Video] {
//        
//        let video1 = Video(image: Images.naruto, title: "Naruto é um anime centrado em Naruto Uzumaki, um jovem ninja em busca do reconhecimento como líder de sua aldeia, enfrentando obstáculos e construindo amizades. A história explora suas jornadas, treinamentos e batalhas, envolvendo ninjutsu e valores de perseverança.")
//        let video2 = Video(image: Images.bleach, title: "Bleach segue Ichigo Kurosaki, um adolescente com a habilidade de ver espíritos. Após obter poderes de um Shinigami, ele embarca em aventuras para proteger os vivos e os espíritos, enfrentando ameaças sobrenaturais e desvendando mistérios espirituais. A série aborda a luta entre mundos e a evolução de Ichigo como um protetor.")
//        let video3 = Video(image: Images.dbz, title: "Dragon Ball Z segue Goku e seus aliados na defesa da Terra contra ameaças cósmicas. Com batalhas épicas e poderes sobre-humanos, a série aborda a busca das Esferas do Dragão, a evolução dos personagens e suas lutas contra vilões como Freeza, Cell e Majin Buu, explorando amizade, coragem e superação.")
//        let video4 = Video(image: Images.deathNote, title: "Death Note apresenta Light Yagami, um estudante que encontra um caderno capaz de matar quem tem o nome escrito nele. Ele começa uma missão para criar um mundo livre de criminosos, enfrentando o detetive L. A trama explora ética, poder e estratégias intelectuais em um cenário onde mente e justiça colidem.")
//        let video5 = Video(image: Images.shingeki, title: "Shingeki no Kyojin ocorre em um mundo cercado por muralhas, onde a humanidade se refugia de titãs antropofágicos. Eren Yeager, Mikasa e Armin se unem à Tropa de Exploração para enfrentar os titãs após a destruição de suas muralhas. A série explora mistérios, lutas e reviravoltas, enquanto desvenda a verdade sobre os titãs e o mundo exterior.")
//        let video6 = Video(image: Images.kimetsu, title: "Kimetsu no Yaiba segue Tanjiro Kamado, um jovem que se torna um caçador de demônios após sua família ser massacrada e sua irmã ser transformada em um demônio. Ele busca vingança e uma cura para sua irmã, Nezuko, enquanto enfrenta demônios poderosos e explora a hierarquia dos caçadores. A série explora determinação, laços familiares e batalhas intensas em um mundo de fantasia.")
//        let video7 = Video(image: Images.claymore, title: "Claymore segue Clare, uma guerreira meio humana, meio demônio, conhecida como Claymore, que caça demônios chamados Yoma. Em um mundo medieval sombrio, ela enfrenta perigos mortais enquanto desvenda conspirações e mistérios sobre seu passado e a organização que a controla. A série aborda lutas, identidade e sacrifício em um cenário de fantasia sombria.")
//        let video8 = Video(image: Images.myHero, title: "My Hero Academia acompanha Izuku Midoriya, um jovem sem superpoderes em um mundo onde a maioria os possui. Após receber habilidades especiais do lendário herói All Might, ele entra na U.A. High School para se tornar um herói profissional. A série explora seu crescimento, treinamento e desafios contra vilões, abordando a determinação e a responsabilidade heroica.")
//        
//        return [video1, video2, video3, video4, video5, video6, video7, video8]
//        
//    }
//    
//    
//}
