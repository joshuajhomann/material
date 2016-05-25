// WARNING
//
// This file has been generated automatically by Xamarin Studio to store outlets and
// actions made in the UI designer. If it is removed, they will be lost.
// Manual changes to this file may not be handled correctly.
//
using Foundation;
using System.CodeDom.Compiler;

namespace MaterialControls.iOS
{
	[Register ("SwitchView")]
	partial class SwitchView
	{
		[Outlet]
		MaterialControls.MDSwitch CustomSwitch { get; set; }

		[Outlet]
		UIKit.UILabel CustomSwitchStatus { get; set; }

		[Outlet]
		MaterialControls.MDSwitch DefaultSwitch { get; set; }

		[Outlet]
		UIKit.UILabel DefaultSwitchStatus { get; set; }

		[Outlet]
		MaterialControls.MDSwitch DisabledSwitch { get; set; }

		[Outlet]
		UIKit.UILabel DisabledSwitchStatus { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (DefaultSwitch != null) {
				DefaultSwitch.Dispose ();
				DefaultSwitch = null;
			}

			if (CustomSwitch != null) {
				CustomSwitch.Dispose ();
				CustomSwitch = null;
			}

			if (DisabledSwitch != null) {
				DisabledSwitch.Dispose ();
				DisabledSwitch = null;
			}

			if (CustomSwitchStatus != null) {
				CustomSwitchStatus.Dispose ();
				CustomSwitchStatus = null;
			}

			if (DefaultSwitchStatus != null) {
				DefaultSwitchStatus.Dispose ();
				DefaultSwitchStatus = null;
			}

			if (DisabledSwitchStatus != null) {
				DisabledSwitchStatus.Dispose ();
				DisabledSwitchStatus = null;
			}
		}
	}
}
