package com.iris.mcgraw.control
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.MacroCommand;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class StartupCommand extends MacroCommand
	{
		override public function execute(note:INotification):void{
            var app:McGraw = note.getBody() as McGraw;
            
    
        
        }
	
	}
	
}