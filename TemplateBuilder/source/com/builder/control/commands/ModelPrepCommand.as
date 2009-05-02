package com.builder.control.commands
{
	
	import com.builder.model.proxies.FileProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class ModelPrepCommand extends SimpleCommand
	{
		/// overiding the execute method. registers proxy.
		override public function execute(notification:INotification):void{
			facade.registerProxy(new FileProxy())
		}
	}
}