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
	[Register ("TabBarView")]
	partial class TabBarView
	{
		[Outlet]
		MaterialControls.MDSwitch AnimatedSwitch { get; set; }

		[Outlet]
		UIKit.UITextField IndexTextField { get; set; }

		[Outlet]
		UIKit.UITextField LabelTextField { get; set; }

		[Outlet]
		UIKit.UILabel SelectedIndexLabel { get; set; }

		[Outlet]
		MaterialControls.MDTabBar TabBar { get; set; }

		[Action ("AddClicked:")]
		partial void AddClicked (Foundation.NSObject sender);

		[Action ("RemoveClicked:")]
		partial void RemoveClicked (Foundation.NSObject sender);

		[Action ("RenameClicked:")]
		partial void RenameClicked (Foundation.NSObject sender);

		[Action ("ReplaceClicked:")]
		partial void ReplaceClicked (Foundation.NSObject sender);

		[Action ("SelectClicked:")]
		partial void SelectClicked (Foundation.NSObject sender);
		
		void ReleaseDesignerOutlets ()
		{
			if (AnimatedSwitch != null) {
				AnimatedSwitch.Dispose ();
				AnimatedSwitch = null;
			}

			if (IndexTextField != null) {
				IndexTextField.Dispose ();
				IndexTextField = null;
			}

			if (LabelTextField != null) {
				LabelTextField.Dispose ();
				LabelTextField = null;
			}

			if (SelectedIndexLabel != null) {
				SelectedIndexLabel.Dispose ();
				SelectedIndexLabel = null;
			}

			if (TabBar != null) {
				TabBar.Dispose ();
				TabBar = null;
			}
		}
	}
}
