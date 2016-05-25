using System;
using Cirrious.MvvmCross.ViewModels;

namespace MaterialControls.Core
{
	public class ButtonViewModel:BaseViewModel
	{
		public ButtonViewModel ()
		{
		}

		string action;
		public string Action 
		{
			get { return action;}
			set 
			{
				SetProperty (ref action, value, () => Action);
			}
		}

		MvxCommand<object> raiseButtonCommand;
		public MvxCommand<object> RaiseButtonCommand 
		{
			get {
				raiseButtonCommand = raiseButtonCommand ?? new MvxCommand<object> (RaisedButtonClicked);
				return raiseButtonCommand;
			}
		}

		MvxCommand flatButtonCommand;
		public MvxCommand FlatButtonCommand 
		{
			get {
				flatButtonCommand = flatButtonCommand ?? new MvxCommand (FlatButtonClicked);
				return flatButtonCommand;
			}
		}

		MvxCommand floatingButtonCommand;
		public MvxCommand FloatingButtonCommand 
		{
			get {
				floatingButtonCommand = floatingButtonCommand ?? new MvxCommand (FloatingButtonClicked);
				return floatingButtonCommand;
			}
		}

		private void RaisedButtonClicked(object obj) {
			Action = "RaisedButtonClicked";
		}

		private void FlatButtonClicked() {
			Action = "FlatButtonClicked";
		}

		private void FloatingButtonClicked() {
			Action = "FloatingButtonClicked";
		}
	}
}

