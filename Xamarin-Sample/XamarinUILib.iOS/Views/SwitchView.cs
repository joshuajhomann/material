
using System;

using Foundation;
using UIKit;
using MaterialControls.Core;

namespace MaterialControls.iOS
{
	public partial class SwitchView : BaseView<SwitchViewModel>
	{
		public SwitchView () : base ("SwitchView", null)
		{
		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			
			DefaultSwitch.ValueChanged += (object sender, EventArgs e) => {
				DefaultSwitchStatus.Text = DefaultSwitch.On ? "ON": "OFF";
			};

			CustomSwitch.ValueChanged += (object sender, EventArgs e) => {
				CustomSwitchStatus.Text = CustomSwitch.On ? "ON": "OFF";
			};

			DisabledSwitch.ValueChanged += (object sender, EventArgs e) => {
				DisabledSwitchStatus.Text = DisabledSwitch.On ? "ON": "OFF";
			};

			DisabledSwitch.Enabled = false;
		}
	}
}

