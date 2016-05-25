
using System;

using Foundation;
using UIKit;
using MaterialControls;
using MaterialControls.Core;

namespace MaterialControls.iOS
{
	public partial class DatePickerDialogView : BaseView<DatePickerDialogViewModel>
	{
		MDDatePickerDialog pickerDialog;
		public DatePickerDialogView () : base ("DatePickerDialogView", null)
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
			
			// Perform any additional setup after loading the view, typically from a nib.
		}

		partial void ButtonPressed (NSObject sender)
		{
			if(pickerDialog ==null) {
				pickerDialog = new MDDatePickerDialog();
				pickerDialog.Delegate = new DatePickerDialogDelegate(TextField);
			}

			pickerDialog.Show();
		}
	}

	public class DatePickerDialogDelegate:MDDatePickerDialogDelegate {
		UITextField TextField;
		NSDateFormatter DateFormater;

		public DatePickerDialogDelegate (UITextField textField){
			TextField = textField;
			DateFormater = new NSDateFormatter();
			DateFormater.DateFormat = "dd-MM-yyyy";
		}

		#region implemented abstract members of MDCalendarDatePickerDialogDelegate
		public override void DatePickerDialogDidSelectDate (NSDate date)
		{
			TextField.Text = DateFormater.StringFor(date);
		}
		#endregion
	}
}

