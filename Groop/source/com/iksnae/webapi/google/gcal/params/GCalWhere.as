package com.iksnae.webapi.google.gcal.params
{
	public class GCalWhere
	{
		
		public var valueString:String;
		public var rel:String         = "";
		public var label:String       = "";
		
		
		public function GCalWhere(v:String="")
		{
			valueString = v;
		}
		/**
		 * this method creates and xml-formatted string with values provided. 
		 * requires "valueString" to be set
		 * @return String
		 * 
		 */		
		public function xmlNode():String{
			// check if "valueString" property is set, else throw error
			if(valueString==""){
				throw new Error('You must set the "valueString" property before calling GCalWhere.xmlNode()')
			}
			var str:String;
			// with only "label" property available    
			if(label!="" && rel==""){
				str= String("<gd:where label='"+label+"' valueString='"+valueString+"'></gd:where>")
			}else
			
			// with only "rel" property available    
			if(label=="" && rel!=""){
				str= String("<gd:where rel='"+rel+"' valueString='"+valueString+"'></gd:where>")
			}else
			
			// with "label" and "rel" property available    
			if(label!="" && rel!=""){
                str= String("<gd:where label='"+label+"'rel='"+rel+"' valueString='"+valueString+"'></gd:where>")
            }else
			
            // without "label" or "rel" property available			
			if (rel=="" && label==""){
                str= String("<gd:where valueString='"+valueString+"'></gd:where>")
            }
		    return str;
        }

	}
}