package com.cjx.mvc.view.mediator
{
	import assets.AppConfig;
	
	import com.cjx.event.ConstDefine;
	import com.cjx.event.EventName;
	import com.cjx.event.MyDataEvent;
	import com.cjx.mvc.controller.main.ShowModuleCommand;
	import com.cjx.mvc.model.MessageProxy;
	import com.cjx.net.RemoteObjectManager;
	import com.cjx.views.MainContainer;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import spark.components.ToggleButton;
	
	public class MainContainerMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "MainContainerMediator";
		
		public function MainContainerMediator(viewComponent:MainContainer)
		{
			super(NAME, viewComponent);
			
			viewComponent.addEventListener(EventName.MAINCONTAINER_BUTTONCLICK,toggleButtonClick);
			
		}
		
		private function toggleButtonClick(e:Event):void
		{
			var btn:ToggleButton = e.target as ToggleButton;
			
			sendNotification(ShowModuleCommand.NAME,btn);
		}
		
		
		
		
		
		public function get view():MainContainer
		{
			return viewComponent as MainContainer;
		}
		
	}
}