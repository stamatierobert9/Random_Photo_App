//
//  ContentView.swift
//  Random Photo
//
//  Created by Robert Stamatie on 09.04.2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
        
        class viewcontroller: UIViewController {
            
            private let ImageView: UIImageView = {
                let ImageView = UIImageView()
                ImageView.contentMode = .scaleAspectFill
                ImageView.backgroundColor = .white
                return ImageView
            }()
            
            private let Button: UIButton = {
                let Button = UIButton()
                Button.backgroundColor = .white
                Button.setTitle("Random Photo", for: .normal)
                Button.setTitleColor(.black, for: .normal)
                return Button
            }()
            
            let collors : [UIColor] = [
                .systemRed,
                .systemPink,
                .systemBlue,
                .systemBrown,
                .systemOrange
            ]
            
            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .systemBlue
                view.addSubview(ImageView)
                
                ImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                
                ImageView.center = view.center
                
                view.addSubview(Button)
                
                getRandomPhoto()
                Button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            }
            
            @objc func didTapButton(){
                getRandomPhoto()
                
                view.backgroundColor = collors.randomElement()
            }
            
            override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                
                Button.frame = CGRect(
                    x: 30,
                    y:
                        view.frame.size.height-150-view.safeAreaInsets.bottom,
                    width: view.frame.size.width-460,
                    height: 55
                )
                
            }
            
            func getRandomPhoto() {
                let urlString = "https://source.unsplash.com/random/600×600"
                let url = URL(string: urlString)!
                guard let data = try? Data(contentsOf: url) else {
                    return
                }
                ImageView.image = UIImage(data: data)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

