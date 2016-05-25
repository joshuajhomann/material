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
	[Register ("TableViewView")]
	partial class TableViewView
	{
		[Outlet]
		UIKit.UITableView ContentTableView { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (ContentTableView != null) {
				ContentTableView.Dispose ();
				ContentTableView = null;
			}
		}
	}
}
