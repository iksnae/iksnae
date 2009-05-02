package com.builder.control.commands
{
	
	import com.builder.view.mediators.AppMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	/**
	 * this command prepares the view by registering the Modifiers in the Facade with their ViewComponents
	 * 
	 * @author iksnae
	 * 
	 */
	public class ViewPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var app:TemplateBuilder = notification.getBody() as TemplateBuilder;
			facade.registerMediator(new AppMediator(app))
//			facade.registerMediator(new TopNavMediator(app.headerView.topNav));
//			facade.registerMediator(new MainViewMediator(app.mainView));
		}
	}
} 