//
//  WelcomeView.swift
//  nearby-nlw
//
//  Created by Julio Zambom on 10/12/24.
//

import Foundation
import UIKit

public class WelcomeView: UIView {
    var didTapButton: (() -> Void?)?
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoIcon")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Boas vindas ao Nearby!"
        label.font = Typography.titleXL
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Tenha cupons de vantagens para usar em seus estabelecimentos favoritos"
        label.font = Typography.textMD
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelForTips: UILabel = {
        let label = UILabel()
        label.text = "Veja como funciona:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = Typography.textMD
        
        return label
    }()
    
    private let tipsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 24
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.backgroundColor = Colors.greenBase
        button.titleLabel?.font = Typography.action
        button.setTitleColor(Colors.gray100, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTips()
        self.addSubview(logoImageView)
        self.addSubview(welcomeLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(labelForTips)
        self.addSubview(tipsStackView)
        self.addSubview(startButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            labelForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            labelForTips.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            labelForTips.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            tipsStackView.topAnchor.constraint(equalTo: labelForTips.bottomAnchor, constant: 28),
            tipsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            tipsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            startButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc
    private func didTap() {
        didTapButton?()
    }
    
    private func setupTips() {
        let tip1 = TipsView(icon: UIImage(named: "mapIcon") ?? UIImage(),
                            title: "Encontre estabelecimentos",
                            description: "Veja locais perto de você que são parceiros do Nearby")
        
        let tip2 = TipsView(icon: UIImage(named: "qrcode") ?? UIImage(),
                            title: "Ative o cupom com QR Code",
                            description: "Escaneie o código do estabelecimento para usar o benefício")
        
        let tip3 = TipsView(icon: UIImage(named: "ticket") ?? UIImage(),
                            title: "Garanta vantagens",
                            description: "Ative o cupom de onde estiver, em diferentes tipos de estabelecimento")
        
        tipsStackView.addArrangedSubview(tip1)
        tipsStackView.addArrangedSubview(tip2)
        tipsStackView.addArrangedSubview(tip3)
    }
}
