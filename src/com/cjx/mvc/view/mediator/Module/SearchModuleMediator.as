package com.cjx.mvc.view.mediator.Module
{
	import com.cjx.event.ConstDefine;
	import com.cjx.event.EventName;
	import com.cjx.event.MyDataEvent;
	import com.cjx.mvc.model.MessageProxy;
	import com.cjx.net.RemoteObjectManager;
	import com.cjx.views.modules.search.SearchModule;
	
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class SearchModuleMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "SearchModuleMediator";
		
		public function SearchModuleMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			viewComponent.addEventListener(EventName.PATTEN_SEARCH,onPatentSearch);
		}
		
		private function onPatentSearch(e:MyDataEvent):void
		{
			RemoteObjectManager.getInstance().doCommand(ConstDefine.PatentSearch,e.data);
		}
		
		public function get view():SearchModule
		{
			return viewComponent as SearchModule;
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				MessageProxy.PatentSearchResultReceive
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case MessageProxy.PatentSearchResultReceive:
					view.setResult(notification.getBody() as ArrayCollection);
					break;
			}
		}
	}
}