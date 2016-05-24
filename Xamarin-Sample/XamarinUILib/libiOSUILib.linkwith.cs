using System;
using ObjCRuntime;

[assembly: LinkWith ("libiOSUILib.a", LinkTarget.ArmV7 | LinkTarget.Simulator | LinkTarget.Simulator64 | LinkTarget.Arm64, SmartLink = true,Frameworks = "CoreText QuartzCore", ForceLoad = true)]
