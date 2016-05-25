
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
using Cirrious.MvvmCross.Droid.Views;
using MaterialControls.Core;

namespace MaterialControls.Android
{
	[Activity (Label = "BaseView")]			
	public class BaseView<T> : MvxActivity where T:BaseViewModel
	{
		public new T ViewModel
		{
			get { return (T)base.ViewModel; }
			set { base.ViewModel = value; }
		}	
	}
}

