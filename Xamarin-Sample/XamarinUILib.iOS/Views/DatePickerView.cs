
using System;

using Foundation;
using UIKit;
using MaterialControls.Core;
using MaterialControls;
using CoreGraphics;

namespace MaterialControls.iOS
{
	public partial class DatePickerView : BaseView<DatePickerViewModel>
	{
		public DatePickerView () : base ("DatePickerView", null)
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
		}
	}
}

