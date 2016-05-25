
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using MaterialControls.Core;
using Android.Support.Design.Widget;

namespace MaterialControls.Android
{
	[Activity (Label = "TextField")]			
	public class TextField : BaseView<TextFieldViewModel>
	{
		protected override void OnViewModelSet ()
		{
			base.OnViewModelSet ();
			SetContentView (Resource.Layout.textfield);
			var passwordInput = FindViewById<TextInputLayout> (Resource.Id.password_text_input_layout);
			passwordInput.SetError ("Wrong password");
			passwordInput.SetErrorEnabled (true);
		}
	}
}

