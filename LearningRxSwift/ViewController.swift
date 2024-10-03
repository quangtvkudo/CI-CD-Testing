//
//  ViewController.swift
//  LearningRxSwift
//
//  Created by Tran Van Quang on 09/01/2024.
//

import UIKit
//import RxSwift
//import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
//    private var viewModel: PostViewModel = PostViewModel(params: nil)
//    private var bag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
//        self.bindingData()
        
    }

//    func bindingData() {
//        Observable.combineLatest(tfUser.rx.text, tfPassword.rx.text) { username, password in
//            
//        }.subscribe { _ in
//        }.disposed(by: bag)
//        
//        self.viewModel.postsResult.subscribe { values in
//            guard let values = values.element else { return }
//            print(values)
//        }.disposed(by: bag)
//        
//        self.viewModel.imagesResult.subscribe { values in
//            guard let values = values.element, !values.isEmpty else { return }
//            print(values)
//        }.disposed(by: bag)
//        
//        self.viewModel.dispatch(.loadAllPosts)
//        
//        let urls: [String]  = [
//            "https://images.pexels.com/photos/1003914/pexels-photo-1003914.jpeg?cs=srgb&dl=pexels-samer-daboul-1003914.jpg&fm=jpg",
//            "https://img.freepik.com/free-photo/fresh-yellow-daisy-single-flower-close-up-beauty-generated-by-ai_188544-15543.jpg?size=626&ext=jpg&ga=GA1.1.1700460183.1707955200&semt=ais",
//                             "hehe"]
//        self.viewModel.dispatch(.fetchingImages(urls))
//    }
}

