package com.groop.gcal
{
	import com.adobe.xml.syndication.atom.Entry;
	
	[Bindable]
	public class GCalender
	{
		private var _title:String;
		private var _description:String;
        private var _color:uint;
        
        private var _entryObj:Entry;
        
		public function GCalender()
		{
		}
		public function get entry():Entry{
			return _entryObj
		}
		public function get label():String{
            return _entryObj.title
        }
		public function set entry(e:Entry):void{
            _entryObj = e
            _title = _entryObj.title;
            trace(_entryObj.id)
        }
        public function get title():String{
        	return _title
		}
        
        

	}
}