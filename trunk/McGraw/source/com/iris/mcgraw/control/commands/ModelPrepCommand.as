package com.iris.mcgraw.control.commands
{
	import com.iris.mcgraw.model.proxies.MailServiceProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class ModelPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			facade.registerProxy(new MailServiceProxy())
		}
	}
}