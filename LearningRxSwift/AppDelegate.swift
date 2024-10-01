//
//  AppDelegate.swift
//  LearningRxSwift
//
//  Created by Tran Van Quang on 09/01/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        print(findLongestCharacter(from: "Hello world"))
        return true
    }
    
    func findLongestCharacter(from string: String) -> String {
        var data: [String: Int] = [:]
        for index in 0..<string.count {
            let char = String(string[string.index(string.startIndex, offsetBy: index)..<string.index(string.startIndex, offsetBy: index + 1)])
            if let value = data[char] {
                data[char] = value + 1
            } else {
                data[char] = 1
            }
        }
        if let maxValue = data.values.max(), let maxKey = data.first(where: { $0.value == maxValue })?.key {
            return maxKey
        }
        return ""
    }
    
    private func mergeSort(_ array: [Int]) -> [Int] {
        if array.count < 2 {
            return array
        }
        
        let index = array.count/2
        let leftArr = mergeSort(Array(array[0..<index]))
        let rightArray = mergeSort(Array(array[index..<array.count]))
        
        return merge(leftArr, rightArray)
    }
    
    func merge(_ leftArr: [Int], _ rightArr: [Int]) -> [Int] {
        var result: [Int] = []
        var leftIndex: Int = 0
        var rightIndex: Int = 0
        
        while leftIndex < leftArr.count && rightIndex < rightArr.count {
            if leftArr[leftIndex] < rightArr[rightIndex] {
                result.append(leftArr[leftIndex])
                leftIndex += 1
            } else {
                result.append(rightArr[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < leftArr.count {
            result.append(leftArr[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightArr.count {
            result.append(rightArr[rightIndex])
            rightIndex += 1
        }
        
        return result
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

