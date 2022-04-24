//
//  URLSessionDataTaskMock.swift
//  ImagesF
//
//  Created by andriy kruglyanko on 23.04.2022.
//

import Foundation

class URLSessionDataTaskMock : URLSessionDataTask {
    
    private let taskAction: () -> Void
    
    init(taskAction: @escaping () -> Void) {
        self.taskAction = taskAction
    }
    
    override func resume() {
        taskAction()
    }
}
