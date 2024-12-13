//
//  SplashView.swift
//  nearby-nlw
//
//  Created by Julio Zambom on 09/12/24.
//

import Foundation
import UIKit

class SplashView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let loadingIndicatorView: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.color = .white
        loading.startAnimating()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

        return loading
    }()
    
    private func setupUI() {
        self.addSubview(logoImageView)
        self.addSubview(backgroundImageView)
        self.addSubview(loadingIndicatorView)
     
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            loadingIndicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
            loadingIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
