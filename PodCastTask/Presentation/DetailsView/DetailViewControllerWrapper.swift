//
//  DetailViewControllerWrapper.swift
//  PodCastTask
//
//  Created by Ahmad on 24/11/2024.
//

import SwiftUI
import UIKit

struct DetailViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = DetailsViewController
    
    var item: PodCastSectionContent
    
    func makeUIViewController(context: Context) -> DetailsViewController {
        let detailVC = DetailsViewController()
        detailVC.item = item
        return detailVC
    }
    
    func updateUIViewController(_ uiViewController: DetailsViewController, context: Context) {
    }
}
