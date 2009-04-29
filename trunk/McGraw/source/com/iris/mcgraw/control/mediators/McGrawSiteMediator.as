package com.iris.mcgraw.control.mediators
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class McGrawSiteMediator extends Mediator implements IMediator
	{
		static public const NAME:String = 'McGrawSiteMediator';
		public function McGrawSiteMediator(viewComponent:Object=null):void{
			trace(NAME)
			//DisplayObjectContainer(viewComponent).addChild(_tf)
		}
	}
}