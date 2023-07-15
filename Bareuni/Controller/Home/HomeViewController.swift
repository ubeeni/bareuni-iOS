//
//  HomeViewController.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/09.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var reviewBtn: UIButton!
    
    var images = ["AD", "AD", "AD"]
    
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        addContentScrollView()
        setPageControl()
        setupNavigationBar()
    }

    private func addContentScrollView() {
        for i in 0..<images.count {
            if let image = UIImage(named: images[i]) {
                let imageView = UIImageView()
                let xPos = scrollView.frame.width * CGFloat(i)
                imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
                imageView.image = image
                scrollView.addSubview(imageView)
                scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
            }
        }
    }
        
    private func setPageControl() {
        pageControl.numberOfPages = images.count
        
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
    func setupNavigationBar() {
        let searchImage = UIImage(named: "icon_search")
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(searchImage, for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        let search = UIBarButtonItem(customView: searchButton)

        let bellImage = UIImage(named: "icon_bell")
        let bellButton = UIButton(type: .custom)
        bellButton.setImage(bellImage, for: .normal)
        bellButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        bellButton.addTarget(self, action: #selector(bellButtonTapped), for: .touchUpInside)
        let bell = UIBarButtonItem(customView: bellButton)

        navigationItem.rightBarButtonItems = [bell, search]

        let titleLabel = UILabel()
        titleLabel.text = "홈"
        titleLabel.font = UIFont(name: "Pretendard-Medium", size: 24)
        titleLabel.textColor = .black
        titleLabel.sizeToFit()

        let titleContainerView = UIView()
        titleContainerView.addSubview(titleLabel)
        titleContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor, constant: -8),
            titleLabel.centerYAnchor.constraint(equalTo: titleContainerView.centerYAnchor)
        ])

        let titleContainerBarButtonItem = UIBarButtonItem(customView: titleContainerView)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        navigationItem.leftBarButtonItems = [flexibleSpace, titleContainerBarButtonItem]

        navigationItem.title = ""
    }
    
    @objc func searchButtonTapped() {
//        let searchViewController = SearchViewController()
//        navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    @objc func bellButtonTapped() {
       
    }
}

// 검색 화면
/*
class SearchViewController: UIViewController {
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "치과명 또는 키워드를 검색하세요."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let recommendationLabel: UILabel = {
        let label = UILabel()
        label.text = "추천 키워드"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupUI()
    }

    private func setupNavigationBar() {
        let searchContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 36))
        searchContainerView.addSubview(searchTextField)
        searchContainerView.addSubview(recommendationLabel)
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        recommendationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: searchContainerView.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: searchContainerView.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: searchContainerView.trailingAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: searchContainerView.bottomAnchor),
            
            recommendationLabel.centerXAnchor.constraint(equalTo: searchContainerView.centerXAnchor),
            recommendationLabel.bottomAnchor.constraint(equalTo: searchContainerView.topAnchor, constant: -8)
        ])
        
        navigationItem.titleView = searchContainerView
    }

    private func setupUI() {
        view.addSubview(recommendationLabel)
        
        NSLayoutConstraint.activate([
            recommendationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recommendationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
*/
