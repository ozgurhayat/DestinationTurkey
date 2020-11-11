//
//  CyclingCityVC.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 28/10/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

class GastronomyVC: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    
    private var imageViews = [UIImageView]()
    private var item: [AttractionItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaceholderItems()
        setupCollectionView()
        setupPageControl()
        setupImageViews()

        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupPlaceholderItems() {
        item = AttractionItems.gastronomyItems
    }
    
    private func setupImageViews() {
        item.forEach { item in
            let imageView = UIImageView(image: item.image)
            imageView.contentMode = .scaleAspectFill
            imageView.alpha = 0.0
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.clipsToBounds = true
            containerView.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6),
                imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ])
            imageViews.append(imageView)
        }
        imageViews.first?.alpha = 1.0
        containerView.bringSubviewToFront(collectionView)
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = item.count
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        let nextRow = getCurrentIndex() + 1
        let nextIndexPath = IndexPath(row: nextRow, section: 0)
        collectionView.scrollToItem(at: nextIndexPath, at: .left, animated: true)
        showItem(at: nextRow)
    }
    
    private func showItem(at index: Int) {
        pageControl.currentPage = index
        let shouldHide = index == item.count - 1
        nextButton.isHidden = shouldHide
    }
    
    private func getCurrentIndex() -> Int {
        return Int(collectionView.contentOffset.x / collectionView.frame.width)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let index = getCurrentIndex()
        let fadeInAlpha = (x - collectionViewWidth * CGFloat(index)) / collectionViewWidth
        let fadeOutAlpha = CGFloat(1 - fadeInAlpha)
        let canShow = (index < item.count - 1)
        guard canShow else { return }
        imageViews[index].alpha = fadeOutAlpha
        imageViews[index + 1].alpha = fadeInAlpha
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = getCurrentIndex()
        showItem(at: index)
    }
    
    var collectionViewWidth: CGFloat {
        return collectionView.frame.size.width
    }
}

extension GastronomyVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cyclingCell", for: indexPath) as! CyclingCollectionViewCell
        let itemAttraction = item[indexPath.item]
        cell.cyclingCityConfigure(with: itemAttraction)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
