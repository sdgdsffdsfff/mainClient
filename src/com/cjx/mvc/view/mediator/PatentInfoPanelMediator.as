package com.cjx.mvc.view.mediator
{
	import com.cjx.event.EventName;
	import com.cjx.views.common.PatentInfoPanel;
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class PatentInfoPanelMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "PatentInfoPanelMediator";
		
		public function PatentInfoPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			
			view.addEventListener(EventName.PATENT_INFOPANEL_HIDE,hide);
		}
		
		public function show(x:int,y:int):void
		{
			TweenLite.to(view,1,{x:x,y:y});
		}
		
		public function hide(e:Event = null):void
		{
			TweenLite.to(view,1,{x:-view.width,y:-view.height});
		}
		
		public function get view():PatentInfoPanel
		{
			return viewComponent as PatentInfoPanel;
		}
	}
}