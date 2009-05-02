package com.builder.model.proxies
{
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class FileProxy extends Proxy implements IProxy
	{
		static public const NAME:String               = 'FileProxy';
		static public const CREATE_PROJECT:String     = 'create_project';
		
		public function FileProxy(data:Object=null)
		{
			super(NAME, data);
		}
		
	}
}