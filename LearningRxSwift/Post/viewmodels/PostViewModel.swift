//
//  PostViewModel.swift
//  LearningRxSwift
//
//  Created by Tran Van Quang on 09/01/2024.
//

import UIKit
import RxSwift
import RxCocoa

enum PostViewModelParams: ViewModelParams {
    
}

enum PostViewModelEvent: ViewModelEvent {
    case showProgress
    case hideProgress
    case `nil`
}

enum PostViewModelAction: ViewModelAction {
    case loadAllPosts
    case fetchingImages(_ urls: [String])
}

class PostViewModel: BaseViewModelProtocol {

    required init(params: PostViewModelParams?) {
        
    }
    
    var event: BehaviorRelay<PostViewModelEvent> = BehaviorRelay<PostViewModelEvent>(value: .nil)
    private var disposeBag: DisposeBag = DisposeBag()
    
    private var posts: PublishSubject<[Int]> = PublishSubject()
    var postsResult: Observable<[Int]> {
        return posts.asObservable()
    }
    
    private var images: PublishSubject<[UIImage]> = PublishSubject()
    var imagesResult: Observable<[UIImage]> {
        return images.asObservable()
    }
    
    func performAction(_ action: PostViewModelAction) -> [PostViewModelEvent] {
        switch action {
        case .loadAllPosts:
            self.loadPosts().subscribe { values in
                self.posts.onNext(values.element ?? [])
            }
            .disposed(by: disposeBag)
            return [.showProgress]
        case .fetchingImages(let urls):
            Task {
                await self.fetchingImages(urls).subscribe { images in
                    self.images.onNext(images.element ?? [])
                }
                .disposed(by: disposeBag)
            }
            return [.showProgress]
        }
    }
    
    func loadPosts() -> Observable<[Int]> {
        return Observable.of([1, 2, 3, 4])
    }
    
    func fetchingImages(_ files: [String]) async -> Observable<[UIImage]> {
        let images = await self.downloadPhotos(urls: files)
        return Observable.of(images)
    }
    
    func downloadPhotoAsync(fileUrl: String) async throws -> Data? {
        guard let url = URL(string: fileUrl) else { return nil }
        let data = try await URLSession.shared.data(from: url)
        return data.0
    }
    
    func downloadPhotos(urls: [String]) async -> [UIImage]  {
        await withTaskGroup(of: Data?.self) { group in
            
            for url in urls {
                let _ = group.addTaskUnlessCancelled {
                    do {
                        return try await self.downloadPhotoAsync(fileUrl: url)
                    } catch {
                        return nil
                    }
                }
            }
            
            var results: [UIImage] = []
            for await data in group {
                guard let data = data, let image = UIImage(data: data) else { continue }
                results.append(image)
            }
            
            return results
        }
    }
}
