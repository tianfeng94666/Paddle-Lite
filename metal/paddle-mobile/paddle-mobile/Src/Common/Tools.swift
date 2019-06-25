/* Copyright (c) 2018 PaddlePaddle Authors. All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License. */

import Foundation

func writeToLibrary<P: PrecisionProtocol>(fileName: String, array: [P]) throws {
    guard let libraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last else {
        let error = PaddleMobileError.defaultError(message: "library path get error")
        throw paddleMobileLogAndThrow(error: error)
    }
    let filePath = libraryPath + "/" + fileName
    let fileManager = FileManager.init()
    fileManager.createFile(atPath: filePath, contents: nil, attributes: nil)
    guard let fileHandler = FileHandle.init(forWritingAtPath: filePath) else {
        let error = PaddleMobileError.defaultError(message: "file handler nil")
        throw paddleMobileLogAndThrow(error: error)
    }
    let data = Data.init(buffer: UnsafeBufferPointer.init(start: array, count: array.count))
    fileHandler.write(data)
    fileHandler.closeFile()
}

public func writeToLibrary<P: PrecisionProtocol>(fileName: String, buffer: UnsafeBufferPointer<P>) throws {
    guard let libraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last else {
        let error = PaddleMobileError.defaultError(message: "library path get error")
        throw paddleMobileLogAndThrow(error: error)
    }
    let filePath = libraryPath + "/" + fileName
    let fileManager = FileManager.init()
    fileManager.createFile(atPath: filePath, contents: nil, attributes: nil)
    guard let fileHandler = FileHandle.init(forWritingAtPath: filePath) else {
        let error = PaddleMobileError.defaultError(message: "file handler nil")
        throw paddleMobileLogAndThrow(error: error)
    }
    let data = Data.init(buffer: buffer)
    fileHandler.write(data)
    fileHandler.closeFile()
}

func createFile(fileName: String) throws -> String {
    guard let libraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last else {
        let error = PaddleMobileError.defaultError(message: "library path get error")
        throw paddleMobileLogAndThrow(error: error)
    }
    let filePath = libraryPath + "/" + fileName
    let fileManager = FileManager.init()
    fileManager.createFile(atPath: filePath, contents: nil, attributes: nil)
    return filePath
}

