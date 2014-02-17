package com.cjx.mvc.view.mediator
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ApplicationMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ApplicationMediator";
		
		public function ApplicationMediator(viewComponent:mainClient)
		{
			super(NAME,viewComponent);
		}
		
		public function get view():mainClient
		{
			return viewComponent as mainClient;
		}
	}
}