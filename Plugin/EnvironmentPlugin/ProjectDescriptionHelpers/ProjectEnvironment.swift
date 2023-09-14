import ProjectDescription

public struct ProjectEnvironment {
    public let appName: String
    public let targetName: String
    public let targetTestName: String
    public let organizationName: String
    public let deploymentTarget: DeploymentTarget
    public let platform: Platform
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment (
    appName: "YuseongAllowancePayments",
    targetName: "YuseongAllowancePayments",
    targetTestName: "YuseongAllowancePaymentsTests",
    organizationName: "com.yuseong.allowance",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.ipad]),
    platform: .iOS,
    baseSetting: [:]
)
