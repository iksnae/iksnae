package com.iris.mcgraw.control.commands
{
	import com.iris.mcgraw.control.mediators.McGrawSiteMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class ViewPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var app:McGraw = notification.getBody() as McGraw;
			facade.removeMediator(new McGrawSiteMediator(app))
		}
	}
}