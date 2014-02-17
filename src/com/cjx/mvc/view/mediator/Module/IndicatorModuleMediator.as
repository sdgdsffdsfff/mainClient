package com.cjx.mvc.view.mediator.Module
{
	import com.cjx.event.EventName;
	import com.cjx.event.MyDataEvent;
	import com.cjx.mvc.core.CommandConst;
	import com.cjx.mvc.model.MessageProxy;
	import com.cjx.net.RemoteObjectManager;
	import com.cjx.views.modules.indicator.IndicatorModule;
	import com.cjx.views.modules.indicator.IndicatorParam;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * 指标统计模块的view层
	 * 
	 * @author cjx;
	 * 
	 * */
	public class IndicatorModuleMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "IndicatorModuleMediator";
		
		public function IndicatorModuleMediator( viewComponent:IndicatorModule)
		{
			super(NAME, viewComponent);
			
			viewComponent.addEventListener(EventName.INDICATOR_SUBMIT,onIndicatorSubmit);
		}
		
		private function onIndicatorSubmit(e:MyDataEvent):void
		{
			var value:IndicatorParam = e.data as IndicatorParam;
			
			RemoteObjectManager.getInstance().doCommand(value.indicatorType,value);
		}
		
		public function get view():IndicatorModule
		{
			return viewComponent as IndicatorModule;
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				MessageProxy.TECHNICAL_GROWTH_RATE_RECEIVE
				
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case MessageProxy.TECHNICAL_GROWTH_RATE_RECEIVE:
					view.dataProvider = notification.getBody() as ArrayCollection;
					break;
			}
		}
	}
}