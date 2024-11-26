//
//  MockGetHomeSectionsUseCase.swift
//  PodCastTask
//
//  Created by Ahmad on 26/11/2024.
//

import PodCastTask
import Combine

class MockGetHomeSectionsUseCase: GetHomeSectionsUseCase {
    var result: Result<[PodCastSection], Error>?
    
    func execute() -> AnyPublisher<[PodCastSection], Error> {
        guard let result = result else {
                    fatalError("MockGetHomeSectionsUseCase: `result` was not set before calling `execute()`.")
                }
        return Future { promise in
            promise(result )
        }
        .eraseToAnyPublisher()
    }
}
