//
//  ViewController.swift
//  Networking2
//
//  Created by Oleg on 10.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func getImageButton(_ sender: Any) {
        //1) получаем url : String
        let urlString = "https://picsum.photos/300/400"
        //2) создаем URL
        guard let apiURL = URL(string: urlString) else { return }
        
        // 3) инициализируем сессию
        let session = URLSession(configuration: .default)
        
        //4) создаем запрос dataTask
        let task = session.dataTask(with: apiURL) { (data, response, error) in
            //5) обработать полученные данные
            guard let data = data, error == nil  else { return }
            DispatchQueue.main.async {
                // data = .jpeg
                self.imageView.image = UIImage(data: data )
            }
        }
        //запускаем запрос
        task.resume()
        
    }
}
