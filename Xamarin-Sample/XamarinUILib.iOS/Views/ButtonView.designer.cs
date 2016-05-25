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
	[Register ("ButtonView")]
	partial class ButtonView
	{
		[Outlet]
		MaterialControls.MDButton FlatButton { get; set; }

		[Outlet]
		MaterialControls.MDButton FloatingActionButton { get; set; }

		[Outlet]
		UIKit.UILabel Label { get; set; }

		[Outlet]
		MaterialControls.MDButton RaisedButton { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (FlatButton != null) {
				FlatButton.Dispose ();
				FlatButton = null;
			}

			if (FloatingActionButton != null) {
				FloatingActionButton.Dispose ();
				FloatingActionButton = null;
			}

			if (Label != null) {
				Label.Dispose ();
				Label = null;
			}

			if (RaisedButton != null) {
				RaisedButton.Dispose ();
				RaisedButton = null;
			}
		}
	}
}
