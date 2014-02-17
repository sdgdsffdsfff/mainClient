package com.cjx.mvc.controller.main
{
	import assets.AppConfig;
	
	import com.cjx.manager.ModulesManager;
	import com.cjx.mvc.model.ModuleLoaderProxy;
	import com.cjx.mvc.view.mediator.ModuleContainerMediator;
	import com.cjx.views.common.ModuleBase;
	import com.cjx.views.modules.clusterAnalysis.ClusterAnalysisModule;
	import com.cjx.views.modules.indicator.IndicatorModule;
	import com.cjx.views.modules.search.SearchModule;
	
	import flash.display.DisplayObject;
	
	import mx.core.UIComponent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import spark.components.ToggleButton;
	
	/**
	 * 处理主面板上方按钮点击事件
	 * 如果选择模块还没加载，则开始加载并添加到主显示区域
	 * 如果模块已加载，则显示或隐藏
	 * 
	 * */
	public class ShowModuleCommand extends SimpleCommand
	{
		public static const NAME:String = "ShowModuleCommand";
		
		public static const CREATE_MODULE_SUCCESS:String = "createModuleSuccess";
		
		public function ShowModuleCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var btn:ToggleButton = notification.getBody() as ToggleButton;
			if(ModulesManager.getInstance().isModuleLoaded(btn.name))
			{
				var dp:DisplayObject = ModulesManager.getInstance().getModule(btn.name);
				dp.visible = btn.selected;
			}
			else
			{
				var module:ModuleBase;
				switch(btn.name)
				{
					case AppConfig.INDICATOR:
						module = new IndicatorModule();
						break;
					case AppConfig.CLUSTERANALYSIS:
						module = new ClusterAnalysisModule();
						break;
					case AppConfig.PATENTSEARCH:
						module = new SearchModule();
						break;
				}
				sendNotification(CREATE_MODULE_SUCCESS,module);
				ModulesManager.getInstance().addModule(btn.name,module);
			}
		}
	}
}