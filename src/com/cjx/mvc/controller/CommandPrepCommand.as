package com.cjx.mvc.controller
{
	import com.cjx.mvc.controller.main.ShowModuleCommand;
	import com.cjx.mvc.controller.module.indicator.GetIndicatorDataCommand;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 所有command在此类注册
	 * 
	 * */
	public class CommandPrepCommand extends SimpleCommand
	{
		public function CommandPrepCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			//main
			facade.registerCommand(ShowModuleCommand.NAME,ShowModuleCommand);
			
			//indicator
			facade.registerCommand(GetIndicatorDataCommand.NAME,GetIndicatorDataCommand);
			
			//cluster
			
		}
	}
}