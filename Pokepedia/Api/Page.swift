import Foundation

public struct Page {
    public let start: Int
    public let pageSize: Int
    
    public init(start: Int = 1, pageSize: Int = 10) {
        self.start = start
        self.pageSize = pageSize
    }
    
    public func next() -> Page {
        Page(start: start + pageSize, pageSize: pageSize)
    }
    
    public func previous() -> Page {
        if start - pageSize > 0 {
            return Page(start: start - pageSize, pageSize: pageSize)
        }
        
        return self
    }
}
