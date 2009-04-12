package com.iksnae.webapi.google.gcal.params
{
	public class GCalSettings
	{
		
        
        
		public function GCalSettings()
		{
		}
		static public function xmlNode():String{
            return '<gCal:settingsProperty value="'+value+'"/>'
        }

	}
}