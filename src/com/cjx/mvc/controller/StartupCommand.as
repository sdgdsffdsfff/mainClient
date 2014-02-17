package com.cjx.mvc.controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	public class StartupCommand extends MacroCommand
	{
		public function StartupCommand()
		{
			super();
		}
		
		override protected function initializeMacroCommand():void
		{
			addSubCommand(CommandPrepCommand);
			addSubCommand(ModelPrepCommand);
			addSubCommand(ViewPrepCommand);
		}
		
	}
}