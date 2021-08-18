/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The extension of Data that provides a convenience method for generating a thumbnail from image data.
*/

import UIKit

extension Data {
    func thumbnail(pixelSize: Int = 128) -> UIImage? {
        let options = [kCGImageSourceCreateThumbnailWithTransform: true,
                       kCGImageSourceCreateThumbnailFromImageAlways: true,
                       kCGImageSourceThumbnailMaxPixelSize: pixelSize] as CFDictionary
        guard let imageSource = CGImageSourceCreateWithData(self as CFData, nil) else {
            return nil
        }
        let imageReference = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options)!
        return UIImage(cgImage: imageReference)
    }
}
