package com.iris.mcgraw.control.commands
{
	import com.iris.mcgraw.view.mediators.MainViewMediator;
	import com.iris.mcgraw.view.mediators.McGrawSiteMediator;
	import com.iris.mcgraw.view.mediators.TopNavMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class ViewPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var app:McGraw = notification.getBody() as McGraw;
			facade.registerMediator(new McGrawSiteMediator(app))
			facade.registerMediator(new TopNavMediator(app.headerView.topNav));
			facade.registerMediator(new MainViewMediator(app.mainView));
		}
	}
} 