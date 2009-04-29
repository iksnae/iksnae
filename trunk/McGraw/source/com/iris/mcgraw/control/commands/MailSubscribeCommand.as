package com.iris.mcgraw.control.commands
{
	import com.iris.mcgraw.model.proxies.MailServiceProxy;
	import com.iris.mcgraw.model.vo.MailRegistrantObject;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class MailSubscribeCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var urlVars:MailRegistrantObject = notification.getBody() as MailRegistrantObject;
			var mailProxy:MailServiceProxy;
			mailProxy = facade.retrieveProxy(MailServiceProxy.NAME) as MailServiceProxy;
			mailProxy.addToMailList(urlVars)
		}
	}
}