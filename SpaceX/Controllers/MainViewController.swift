//
//  MainViewController.swift
//  SpaceX
//
//  Created by Денис Харына on 20.12.2022.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate {
    //MARK: - Main Properties
    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let pageControl = UIPageControl()
    
    private let reuseIdentifier = "CollectionViewCell"
    var allRockets = [Rocket]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.pageControl.numberOfPages = self.allRockets.count
            }
        }
    }
    var allLaunches = [Launch]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiManager.shared.getRockets { rockets in
            self.allRockets = rockets
        }
        ApiManager.shared.getLaunches { launches in
            self.allLaunches = launches
        }
        configureUI()
        constrain()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        pageControl.currentPage = currentPage
    }
    
    //MARK: - Helping
    private func configureUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height-72)
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RocketCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        
        pageControl.backgroundColor = Style.Colors.pageControlBackground
        pageControl.pageIndicatorTintColor = UIColor(red: 142/255, green: 142/255, blue: 143/255, alpha: 1)
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.isUserInteractionEnabled = false
    }
    private func constrain() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -60),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height - 12),
            
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
}

//MARK: - UICollectionViewDataSource
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
                    cell.imageView.image = UIImage(data: data)?.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
                }
            }
        }
        cell.delegate = self
        cell.titleLabel.text = rocket.name
        
        let prevFormatter = DateFormatter()
        prevFormatter.dateFormat = "yyyy-MM-dd"
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM, yyyy"
        let date = prevFormatter.date(from: rocket.firstFlight)!
        cell.firstLaunch.text = formatter.string(from: date)
        
        cell.country.text = rocket.country
        cell.price.text = "$\(Float(rocket.costPerLaunch) / 1000000.0) M"
        
        let tonStr = NSAttributedString(string: " ton", attributes: [.foregroundColor: Style.Colors.rocketInfoTextColor])
        let secStr = NSAttributedString(string: " sec", attributes: [.foregroundColor: Style.Colors.rocketInfoTextColor])
        
        cell.numberOfEngines.text = String(rocket.firstStage.engines)
        cell.fuelAmount.configureAttributedStr(with: String(rocket.firstStage.fuelAmountTons), addition: tonStr)
        if let burnTime = rocket.firstStage.burnTimeSEC {
            cell.burnTime.configureAttributedStr(with: String(burnTime), addition: secStr)
        }
        cell.numberOfEngines2.text = String(rocket.secondStage.engines)
        cell.fuelAmount2.configureAttributedStr(with: String(rocket.secondStage.fuelAmountTons), addition: tonStr)
        if let burnTime2 = rocket.secondStage.burnTimeSEC {
            cell.burnTime2.configureAttributedStr(with: String(burnTime2), addition: secStr)
        }
        return cell
    }
}

//MARK: - PushControllersDelegate
extension MainViewController: PushControllersDelegate {
    func pushLaunchesController(title: String, id: String) {
        let vc = LaunchesViewController()
        vc.title = title
        for launch in allLaunches {
            if launch.rocket == id {
                vc.allLaunches.append(launch)
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    func presentSettingsController() {
        self.present(UINavigationController(rootViewController: SettingsViewController()), animated: true)
    }
}
