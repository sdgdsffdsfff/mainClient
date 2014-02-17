package com.cjx.mvc.core
{
	import com.cjx.mvc.controller.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		public static const STARTUP:String = "appStartUp";
		
		public static function getInstance():ApplicationFacade
		{
			if(instance == null)
			{
				instance = new ApplicationFacade();
			}
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			
			registerCommand(STARTUP,StartupCommand);
		}
		
		public function startup(app:mainClient):void
		{
			sendNotification(STARTUP,app);
		}
	}
}