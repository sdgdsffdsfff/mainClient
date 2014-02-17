package com.cjx.mvc.controller.module.indicator
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class GetIndicatorDataCommand extends SimpleCommand
	{
		public static const NAME:String = "GetIndicatorDataCommand";
		
		public function GetIndicatorDataCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			
		}
	}
}