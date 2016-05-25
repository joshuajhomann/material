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
	[Register ("DatePickerDialogView")]
	partial class DatePickerDialogView
	{
		[Outlet]
		UIKit.UITextField TextField { get; set; }

		[Action ("ButtonPressed:")]
		partial void ButtonPressed (Foundation.NSObject sender);
		
		void ReleaseDesignerOutlets ()
		{
			if (TextField != null) {
				TextField.Dispose ();
				TextField = null;
			}
		}
	}
}
