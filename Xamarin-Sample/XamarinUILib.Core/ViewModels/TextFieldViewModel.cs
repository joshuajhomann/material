using System;

namespace MaterialControls.Core
{
	public class TextFieldViewModel:BaseViewModel
	{
		public TextFieldViewModel ()
		{
			
		}

		string text;
		public string Text 
		{
			get { return text;}
			set 
			{
				SetProperty (ref text, value, () => Text);
			}
		}
	}
}

