package com.cjx.mvc.controller
{
	import com.cjx.mvc.model.MessageProxy;
	import com.cjx.mvc.model.ModuleLoaderProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 注册proxy
	 * 
	 * */
	public class ModelPrepCommand extends SimpleCommand
	{
		public function ModelPrepCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			facade.registerProxy(new ModuleLoaderProxy());
			facade.registerProxy(new MessageProxy());
		}
	}
}