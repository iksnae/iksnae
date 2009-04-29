package com.iris.mcgraw.model
{
	import mx.collections.ArrayCollection;
	[Bindable]
	public class McgrawConstants
	{
		
		public function McgrawConstants()
		{
		}
		
		
		static public const SECTION_CHANGE:String = 'section_change'
		static public const NAV_CLICK:String = 'nav_click'
		
		
		static public var US_STATES:ArrayCollection = new ArrayCollection(['Select a state...','ALABAMA','ALASKA','ARIZONA','ARKANSAS','CALIFORNIA','CALIFORNIA',
		'CONNECTICUT','DELAWARE','DISTRICT OF COLUMBIA','FLORIDA','GEORGIA','HAWAII','IDAHO','ILLINOIS','INDIANA','IOWA','KANSAS','KENTUCKY',
		'LOUISIANA','MAINE','MARYLAND','MASSACHUSETTS','MICHIGAN','MINNESOTA','MISSISSIPPI','MISSOURI','MONTANA','NEBRASKA','NEVADA','NEW HAMPSHIRE',
		'NEW JERSEY','NEW MEXICO','NEW YORK','NORTH CAROLINA','NORTH DAKOTA','OHIO','OKLAHOMA','OREGON','PENNSYLVANIA','RHODE ISLAND','SOUTH CAROLINA',
		'SOUTH DAKOTA','TENNESSEE','TEXAS','UTAH','VERMONT','VIRGINIA','WASHINGTON','WEST VIRGINIA','WISCONSIN','WYOMING']);
		
		static public var DATE_MONTHS:ArrayCollection = new ArrayCollection(['JANUARY','FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY','AUGUST','SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER'])
		
		static public function DATE_DAYS(month:String='JANUARY'):ArrayCollection{
			var days:ArrayCollection = new ArrayCollection()
			var start:int = 1;
			var end:int=2009
			if(month=='JANUARY') end = 31;
			if(month=='FEBRUARY') end = 29;
			if(month=='MARCH') end = 31;
			if(month=='APRIL') end = 30;
			if(month=='MAY') end = 31;
			if(month=='JUNE') end = 30;
			if(month=='JULY') end = 31;
			if(month=='AUGUST') end = 31;
			if(month=='SEPTEMBER') end = 30;
			if(month=='OCTOBER') end = 31;
			if(month=='NOVEMBER') end = 30;
			if(month=='DECEMBER') end = 31;
			
			
			
			for(var i:int = start; i<end+1;i++){
				days.addItem(i)
			}
			return days;
		}
		static public function DATE_YEARS(start:int = 1900, end:int=2009):ArrayCollection{
			var years:ArrayCollection = new ArrayCollection()
			for(var i:int = start; i<end;i++){
				years.addItem(i)
			}
			return years;
		}
		
		

	}
}