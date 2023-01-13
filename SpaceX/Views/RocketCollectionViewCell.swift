//
//  RocketCollectionViewCell.swift
//  SpaceX
//
//  Created by Денис Харына on 21.12.2022.
//

import UIKit

class RocketCollectionViewCell: UICollectionViewCell {
    
    var rocket: Rocket?
    private let reuseId = "CellID"
    weak var delegate: PushControllersDelegate?

    //MARK: - Main Properties
    private let scrollView = UIScrollView()
    private let scrollContentView = UIView()
    let imageView = UIImageView()
    private let infoView = UIView()
    let titleLabel = UILabel()
    private let settingsButton = UIButton()
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    let firstLaunch = UILabel()
    let country = UILabel()
    let price = UILabel()
    private var mainInfo = UIView()
    
    private let firstStageTitle = UILabel()
    let numberOfEngines = UILabel()
    let fuelAmount = UILabel()
    let burnTime = UILabel()
    private var firstStage = UIView()
    
    private let secondStageTitle = UILabel()
    let numberOfEngines2 = UILabel()
    let fuelAmount2 = UILabel()
    let burnTime2 = UILabel()
    private var secondStage = UIView()
    
    private let showLaunchesButton = UIButton()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        constrain()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        //self.delegate?.presentSettingsController()
    }
    
    //MARK: - Selectors
    @objc private func settingsTapped() {
        self.delegate?.presentSettingsController()
    }
    
    @objc private func showLaunchesButtonTapped() {
        self.delegate?.pushLaunchesController(title: rocket!.name)
    }

    //MARK: - Helpers
    private func configureUI() {
        scrollView.contentSize = CGSize(width: self.contentView.frame.size.width, height: 1100)
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true

        infoView.backgroundColor = .black
        infoView.layer.cornerRadius = 32

        titleLabel.textColor = Style.Colors.mainTextColor
        titleLabel.font = Style.Fonts.labGrotesqueMedium?.withSize(24)
        
        settingsButton.setImage(UIImage(named: "Settings")!, for: .normal)
        settingsButton.imageView?.contentMode = .scaleAspectFit
        settingsButton.tintColor = Style.Colors.secondaryTextColor
        settingsButton.addTarget(self, action: #selector(settingsTapped), for: .touchUpInside)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 96, height: 96)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(RocketInfoViewCell.self, forCellWithReuseIdentifier: reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = true
        collectionView.backgroundColor = .clear
        
        mainInfo = mainInfo.configureViewWithText(firstFieldText: "First Flight", secondFieldText: "Country", thirdFieldText: "Flight Price", firstLabel: firstLaunch, secondLabel: country, thirdLabel: price)
        firstLaunch.font = UIFont.systemFont(ofSize: 16)
        country.font = UIFont.systemFont(ofSize: 16)
        price.font = UIFont.systemFont(ofSize: 16)
        
        firstStageTitle.configureStageUILable(with: "First Stage")
        firstStage = firstStage.configureViewWithText(firstFieldText: "Engines Amount", secondFieldText: "Fuel Amount", thirdFieldText: "Fuel Burn Time", firstLabel: numberOfEngines, secondLabel: fuelAmount, thirdLabel: burnTime)
        
        secondStageTitle.configureStageUILable(with: "Second Stage")
        secondStage = firstStage.configureViewWithText(firstFieldText: "Engines Amount", secondFieldText: "Fuel Amount", thirdFieldText: "Fuel Burn Time", firstLabel: numberOfEngines2, secondLabel: fuelAmount2, thirdLabel: burnTime2)
        
        showLaunchesButton.backgroundColor = Style.Colors.grayBackground
        showLaunchesButton.setTitle("See Launches", for: .normal)
        showLaunchesButton.titleLabel?.textColor = Style.Colors.mainTextColor
        showLaunchesButton.titleLabel?.font = Style.Fonts.labGrotesqueBold?.withSize(18)
        showLaunchesButton.layer.cornerRadius = 12
        showLaunchesButton.addTarget(self, action: #selector(showLaunchesButtonTapped), for: .touchUpInside)
    }
    
    private func constrain() {
        self.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(imageView)
        scrollContentView.addSubview(infoView)
        infoView.addSubview(titleLabel)
        scrollView.addSubview(settingsButton)
        scrollView.addSubview(collectionView)
        infoView.addSubview(mainInfo)
        infoView.addSubview(firstStageTitle)
        infoView.addSubview(firstStage)
        infoView.addSubview(secondStageTitle)
        infoView.addSubview(secondStage)
        scrollView.addSubview(showLaunchesButton)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollContentView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        infoView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        showLaunchesButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            imageView.topAnchor.constraint(equalTo: scrollContentView.topAnchor, constant: -60),
            imageView.centerXAnchor.constraint(equalTo: scrollContentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollContentView.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),

            infoView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -32),
            infoView.centerXAnchor.constraint(equalTo: scrollContentView.centerXAnchor),
            infoView.widthAnchor.constraint(equalTo: scrollContentView.widthAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 920),

            titleLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 32),
            
            settingsButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -32),
            settingsButton.widthAnchor.constraint(equalToConstant: 32),
            settingsButton.heightAnchor.constraint(equalToConstant: 32),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 96),
            collectionView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            mainInfo.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40),
            mainInfo.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 32),
            mainInfo.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -32),
            mainInfo.heightAnchor.constraint(equalToConstant: 104),
            
            firstStageTitle.topAnchor.constraint(equalTo: mainInfo.bottomAnchor, constant: 40),
            firstStageTitle.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 32),
            
            firstStage.topAnchor.constraint(equalTo: firstStageTitle.bottomAnchor, constant: 16),
            firstStage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 32),
            firstStage.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -32),
            firstStage.heightAnchor.constraint(equalToConstant: 104),
            
            secondStageTitle.topAnchor.constraint(equalTo: firstStage.bottomAnchor, constant: 40),
            secondStageTitle.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 32),
            
            secondStage.topAnchor.constraint(equalTo: secondStageTitle.bottomAnchor, constant: 16),
            secondStage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 32),
            secondStage.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -32),
            secondStage.heightAnchor.constraint(equalToConstant: 104),

            showLaunchesButton.topAnchor.constraint(equalTo: secondStage.bottomAnchor, constant: 40),
            showLaunchesButton.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 32),
            showLaunchesButton.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -32),
            showLaunchesButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

extension RocketCollectionViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! RocketInfoViewCell
        cell.backgroundColor = Style.Colors.grayBackground
        cell.layer.cornerRadius = 32
        guard let rocket = rocket else { return cell }
        switch indexPath.row {
        case 0:
            cell.numberLabel.text = String(rocket.height.feet!)
            cell.text.text = "Height, ft"
        case 1:
            cell.numberLabel.text = String(rocket.diameter.feet!)
            cell.text.text = "Diameter, ft"
        case 2:
            cell.numberLabel.text = String(rocket.mass.lb)
            cell.text.text = "Mass, lb"
        case 3:
            cell.numberLabel.text = String(rocket.payloadWeights[0].lb)
            cell.text.text = "Payload, lb"
        default:
            cell.numberLabel.text = "Text"
            cell.text.text = "text"
        }
        return cell
    }
}
