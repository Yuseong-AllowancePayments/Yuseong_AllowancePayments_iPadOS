// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum DesignSystemAsset {
  public enum GrayScale {
  public static let gray100 = DesignSystemColors(name: "Gray100")
    public static let gray200 = DesignSystemColors(name: "Gray200")
    public static let gray300 = DesignSystemColors(name: "Gray300")
    public static let gray400 = DesignSystemColors(name: "Gray400")
    public static let gray50 = DesignSystemColors(name: "Gray50")
    public static let gray500 = DesignSystemColors(name: "Gray500")
    public static let gray600 = DesignSystemColors(name: "Gray600")
    public static let gray700 = DesignSystemColors(name: "Gray700")
    public static let gray800 = DesignSystemColors(name: "Gray800")
    public static let gray900 = DesignSystemColors(name: "Gray900")
  }
  public enum ImageAssets {
  public static let calendar = DesignSystemImages(name: "calendar")
    public static let invisible = DesignSystemImages(name: "invisible")
    public static let logo = DesignSystemImages(name: "logo")
    public static let textLogo = DesignSystemImages(name: "textLogo")
  }
  public enum PrimaryColor {
  public static let accentColor = DesignSystemColors(name: "AccentColor")
    public static let primary = DesignSystemColors(name: "Primary")
    public static let primaryBackground = DesignSystemColors(name: "Primary_background")
    public static let primaryHover = DesignSystemColors(name: "Primary_hover")
  }
  public enum SystemColor {
  public static let green = DesignSystemColors(name: "green")
    public static let red = DesignSystemColors(name: "red")
    public static let white = DesignSystemColors(name: "white")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class DesignSystemColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }

      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension DesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct DesignSystemImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension DesignSystemImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the DesignSystemImages.image property")
  convenience init?(asset: DesignSystemImages) {
    #if os(iOS) || os(tvOS)
    let bundle = DesignSystemResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: DesignSystemImages) {
    let bundle = DesignSystemResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: DesignSystemImages, label: Text) {
    let bundle = DesignSystemResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: DesignSystemImages) {
    let bundle = DesignSystemResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
