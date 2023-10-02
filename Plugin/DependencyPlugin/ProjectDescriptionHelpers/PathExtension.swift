import ProjectDescription

public extension ProjectDescription.Path {
    static func relativeToSections(_ path: String) -> Self {
        return .relativeToRoot("Projects/\(path)")
    }
    static func relativeToShared(_ path: String) -> Self {
        return .relativeToRoot("Projects/Shared/\(path)")
    }
    static var app: Self {
        return .relativeToRoot("Projects/App")
    }
}
