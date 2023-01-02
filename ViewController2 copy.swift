//
//  ViewController.swift
//  FrameworkCombine
//
//  Created by Macbook on 29.12.2022.
//

import UIKit
import Combine
import SwiftUI

//---------1--------
class ViewController2: UIViewController {

    var subscriptions: Set<AnyCancellable> = []
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let timer = Timer.publish(every: 1, on: RunLoop.main, in: .default)

        timer.autoconnect().scan(0) { ( accumulator, _) -> Int in
            return accumulator + 1
        }.sink { print($0)}
            .store(in: &subscriptions)

    }
}

