package  com.iksnae.webapi.google.gcal.params
{
	public class GCalAccessLevel
	{
		static public const NONE:String       = 'none';
		static public const READ:String       = 'read';
        static public const FREEBUSY:String   = 'freebusy';
        static public const EDITOR:String     = 'editor';
        static public const OWNER:String      = 'owner';
        static public const ROOT:String       = 'root';
        
        public var value:String

		public function GCalAccessLevel(a:String='')
		{
			a = value;	
		}
		
		public function xmlNode():String{
			if(value==''){
                throw new Error('You must set the "value" property before calling GCalAccessLevel.xmlNode()')
            }
			return '<gCal:accesslevel value="'+value+'"/>'
		}
		

	}
}