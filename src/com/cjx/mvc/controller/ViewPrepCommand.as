package com.cjx.mvc.controller
{
	import com.cjx.mvc.view.mediator.ApplicationMediator;
	import com.cjx.mvc.view.mediator.MainContainerMediator;
	import com.cjx.mvc.view.mediator.ModuleContainerMediator;
	import com.cjx.mvc.view.mediator.PatentInfoPanelMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 将主要的mediator注册到facade，其余的mediator等到用到再注册
	 * 
	 * */
	public class ViewPrepCommand extends SimpleCommand
	{
		public function ViewPrepCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var main:mainClient = notification.getBody() as mainClient;
			facade.registerMediator(new ApplicationMediator(main));
			
			facade.registerMediator(new MainContainerMediator(main.mainContainer));
			facade.registerMediator(new ModuleContainerMediator(main.mainContainer.moduleContainer));
			facade.registerMediator(new PatentInfoPanelMediator(main.mainContainer.patentInfoPanel));
		}
	}
}