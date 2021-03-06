//
//  ViewController.swift
//  RandomPhotos
//
//  Created by Pablo Gatgens on 3/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        return imageView
    }()
    let colors:[UIColor] = [
        .systemPink,
        .systemBlue,
        .systemRed,
        .systemCyan,
        .systemGray,
        .systemTeal,
        .systemIndigo,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemGray
        
    ]
    
        
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0,y:0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x:30 , y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    func getRandomPhoto(){
        let urlString =
    "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf : url) else{
            return
        }
        imageView.image = UIImage(data : data)
    }


}

