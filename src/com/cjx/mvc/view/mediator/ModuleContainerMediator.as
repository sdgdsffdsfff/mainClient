package com.cjx.mvc.view.mediator
{
	import com.cjx.manager.ModulesManager;
	import com.cjx.mvc.controller.main.ShowModuleCommand;
	import com.cjx.mvc.model.ModuleLoaderProxy;
	import com.cjx.views.ModuleContainer;
	import com.cjx.views.common.ModuleBase;
	
	import flash.display.DisplayObject;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ModuleContainerMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ModuleContainerMediator";
		
		public function ModuleContainerMediator( viewComponent:ModuleContainer)
		{
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				ShowModuleCommand.CREATE_MODULE_SUCCESS,
				ModuleLoaderProxy.MODULE_LOAD_SUCCESS,
				ModuleLoaderProxy.MODULE_LOAD_FAILED
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case ShowModuleCommand.CREATE_MODULE_SUCCESS:
					var module:ModuleBase = notification.getBody() as ModuleBase;
					moduleContainer.addModule(module);
					break;
				case ModuleLoaderProxy.MODULE_LOAD_SUCCESS:
					var uiModule:UIComponent = notification.getBody() as UIComponent;
					moduleContainer.addModule(uiModule);
					break;
				case ModuleLoaderProxy.MODULE_LOAD_FAILED:
					Alert.show("模块加载失败！error：" + notification.getBody());
					break;
			}
		}
		
		public function get moduleContainer():ModuleContainer
		{
			return viewComponent as ModuleContainer;
		}
	}
}