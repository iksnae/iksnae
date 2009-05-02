package com.builder.control.commands
{
	import org.puremvc.as3.patterns.command.MacroCommand;
	import org.puremvc.as3.interfaces.ICommand;
	/**
	 * this command is called when the application is launched.
	 * it registers the ModelPrepCommand and ViewPrepCommand commands by overriding the initializeMacroCommand method.
	 * each command is launched sequentially
	 * @author iksnae
	 * 
	 */
	public class StartupCommand extends MacroCommand implements ICommand
	{
		// add initial commands
		override protected function initializeMacroCommand():void{
            addSubCommand(ModelPrepCommand)
            addSubCommand(ViewPrepCommand)
        
        }
		
	}
}