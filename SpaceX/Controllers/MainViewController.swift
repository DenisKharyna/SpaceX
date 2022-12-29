//
//  MainViewController.swift
//  SpaceX
//
//  Created by Денис Харына on 20.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - Main Properties
    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let pageController = UIPageControl()
    
    private let reuseIdentifier = "CollectionViewCell"
    var allRockets = [Rocket]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.pageController.numberOfPages = self.allRockets.count
            }
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiManager.shared.getRockets { rockets in
            self.allRockets = rockets
        }
        configureUI()
        constrain()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helping
    private func configureUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height-72)
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(RocketCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isScrollEnabled = true
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        
        pageController.backgroundColor = Style.Colors.pageControlBackground
        pageController.currentPage = 0
        pageController.pageIndicatorTintColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1)
        pageController.currentPageIndicatorTintColor = .white
        
    }
    private func constrain() {
        view.addSubview(collectionView)
        view.addSubview(pageController)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pageController.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height - 72),
            
            pageController.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            pageController.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageController.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allRockets.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RocketCollectionViewCell
        let rocket = allRockets[indexPath.row]
        cell.rocket = rocket
        let url = URL(string: rocket.flickrImages[1])
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                if let data = data {
                    cell.imageView.image = UIImage(data: data)
                }
            }
        }
        cell.titleLabel.text = rocket.name
        cell.firstLaunch.text = rocket.firstFlight
        cell.country.text = rocket.country
        cell.price.text = String(rocket.costPerLaunch)
        cell.numberOfEngines.text = String(rocket.firstStage.engines)
        cell.fuelAmount.text = String(rocket.firstStage.fuelAmountTons) + " ton"
        if let burnTime = rocket.firstStage.burnTimeSEC {
            cell.burnTime.text = String(burnTime) + " sec"
        }
        cell.numberOfEngines2.text = String(rocket.secondStage.engines)
        cell.fuelAmount2.text = String(rocket.secondStage.fuelAmountTons) + " ton"
        if let burnTime2 = rocket.secondStage.burnTimeSEC {
            cell.burnTime2.text = String(burnTime2) + " sec"
        }
        return cell
    }
}
